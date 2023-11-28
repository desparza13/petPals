import 'package:flutter/material.dart';
import 'package:pet_pals/models/comment.dart';
import 'package:pet_pals/models/question.dart';
import 'package:pet_pals/providers/data_provider_questions.dart';
import 'package:timeago/timeago.dart' as timeago;

class QuestionDetailPage extends StatefulWidget {
  final String questionId;

  QuestionDetailPage({required this.questionId});

  @override
  _QuestionDetailPageState createState() => _QuestionDetailPageState();
}

class _QuestionDetailPageState extends State<QuestionDetailPage> {
  late Future<Question> _questionFuture;
  late Future<List<Comment>> _commentsFuture;
  final TextEditingController _commentController = TextEditingController();
  late QuestionsDataProvider _questionsDataProvider;

  @override
  void initState() {
    super.initState();
    _questionsDataProvider = QuestionsDataProvider();
    _questionFuture = _questionsDataProvider.fetchQuestion(widget.questionId);
    _commentsFuture = _questionsDataProvider.fetchCommentsForQuestion(widget.questionId);
    timeago.setLocaleMessages('en', timeago.EnMessages()); 
  }

  void _toggleLike(Question question) {
    final userId = 't5unAPjpCvZbg6nJl52Y'; 
    setState(() {
      if (question.likes.contains(userId)) {
        question.likes.remove(userId);
      } else {
        question.likes.add(userId);
      }
      _questionsDataProvider.updateLikes(question.id, question.likes);
    });
  }

  Widget _buildCommentsSection(List<Comment> comments, ThemeData theme) {
    var theme = Theme.of(context).colorScheme;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => Divider(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        Comment comment = comments[index];
        return Container(
          color: theme.secondaryContainer,
          child: ListTile(
            title: Text(comment.content),
            subtitle: Text(timeago.format(comment.timestamp, locale: 'en')), 
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<Question>(
              future: _questionFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error loading question.'));
                } else if (snapshot.hasData) {
                  Question question = snapshot.data!;
                  bool isLikedByUser = question.likes.contains('t5unAPjpCvZbg6nJl52Y'); 

                  return ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Card(
                          child: ListTile(
                            title: Text(question.content),
                            subtitle: Text(question.answer),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(question.likes.length.toString()), // Shows the number of "likes"
                                IconButton(
                                  icon: Icon(
                                    isLikedByUser ? Icons.favorite : Icons.favorite_border,
                                    color: isLikedByUser ? Colors.red : Colors.grey,
                                  ),
                                  onPressed: () => _toggleLike(question),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      FutureBuilder<List<Comment>>(
                        future: _commentsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error loading comments.'));
                          } else if (snapshot.hasData) {
                            return _buildCommentsSection(snapshot.data!, theme);
                          } else {
                            return Center(child: Text('No comments yet.'));
                          }
                        },
                      ),
                    ],
                  );
                } else {
                  return Center(child: Text('Question not found.'));
                }
              },
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write your comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {
                    _addComment();
                    FocusScope.of(context).unfocus(); // Close the keyboard
                  },
                  child: Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      _questionsDataProvider.addComment(
        widget.questionId,
        _commentController.text,
        'ejemploA', 
      ).then((_) {
        _commentController.clear();
        setState(() {
          _commentsFuture = _questionsDataProvider.fetchCommentsForQuestion(widget.questionId);
        });
      });
    }
  }
}
