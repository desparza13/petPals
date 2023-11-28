import 'package:flutter/material.dart';
import 'package:pet_pals/models/question.dart';
import 'package:pet_pals/providers/data_provider_questions.dart';
import 'package:pet_pals/pages/question_detail_page.dart';
import 'package:pet_pals/pages/add_question_page.dart'; 
import 'package:lottie/lottie.dart'; 

class QAPage extends StatefulWidget {
  @override
  _QAPageState createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  late QuestionsDataProvider _questionsDataProvider;
  final TextEditingController _searchController = TextEditingController();
  List<Question> _questions = [];
  bool _isSearching = false; 
  final userId = 't5unAPjpCvZbg6nJl52Y'; 

  @override
  void initState() {
    super.initState();
    _questionsDataProvider = QuestionsDataProvider();
    _loadQuestions();
    _searchController.addListener(() { 
      _searchQuestions(_searchController.text);
    });
  }

  Future<void> _loadQuestions() async {
    var questions = await _questionsDataProvider.fetchAllQuestions();
    setState(() {
      _questions = questions;
    });
  }

  void _searchQuestions(String query) {
    if (query.isEmpty) {
      setState(() {
        _isSearching = false; 
        _loadQuestions();
      });
    } else {
      setState(() {
        _isSearching = true; 
        _questions = _questions.where((q) {
          return q.content.toLowerCase().contains(query.toLowerCase());
        }).toList();
      });
    }
  }

  void _toggleLike(Question question) {
    setState(() {
      if (question.likes.contains(userId)) {
        question.likes.remove(userId);
      } else {
        question.likes.add(userId);
      }
      _questionsDataProvider.updateLikes(question.id, question.likes);
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    final colors = [
      theme.primaryContainer,
      theme.background,
      theme.secondaryContainer,
      theme.tertiaryContainer,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Q&A'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadQuestions,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search Question',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (query) => _searchQuestions(query),
              ),
            ),
            Expanded(
              child: _isSearching && _questions.isEmpty 
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.asset('assets/lottie/no_results.json', width: 200, height: 200), 
                          Text('No results'),
                        ],
                      ),
                    )
                  : ListView(
                      children: [
                        _buildSectionHeader('Most Voted'),
                        _buildQuestionsList(_getMostVotedQuestions(), colors),
                        _buildSectionHeader('All'),
                        _buildQuestionsList(_questions, colors),
                      ],
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => AddQuestionPage(), 
          ));
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  List<Question> _getMostVotedQuestions() {
    return _questions.where((q) => q.likes.isNotEmpty).toList()
      ..sort((a, b) => b.likes.length.compareTo(a.likes.length));
  }

  Widget _buildQuestionsList(List<Question> questions, List<Color> colors) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        final isLikedByUser = question.likes.contains(userId);

        return Card(
          color: colors[index % colors.length],
          child: ListTile(
            title: Text(question.content),
            subtitle: Text(question.answer, maxLines: 2, overflow: TextOverflow.ellipsis),
            trailing: Row(
              mainAxisSize: MainAxisSize.min, 
              children: [
                Text(question.likes.length.toString()), 
                IconButton(
                  icon: Icon(
                    isLikedByUser ? Icons.favorite : Icons.favorite_border,
                    color: isLikedByUser ? Colors.red : Colors.grey,
                  ),
                  onPressed: () => _toggleLike(question),
                ),
              ],
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => QuestionDetailPage(questionId: question.id),
              ));
            },
          ),
        );
      },
    );
  }
}
