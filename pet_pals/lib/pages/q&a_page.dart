import 'package:flutter/material.dart';
import 'package:pet_pals/models/question.dart';
import 'package:pet_pals/providers/data_provider_questions.dart';
import 'package:pet_pals/pages/question_detail_page.dart';

class QAPage extends StatefulWidget {
  @override
  _QandAPageState createState() => _QandAPageState();
}

class _QandAPageState extends State<QAPage> {
  late QuestionsDataProvider _questionsDataProvider;
  final userId = 't5unAPjpCvZbg6nJl52Y';

  @override
  void initState() {
    super.initState();
    _questionsDataProvider = QuestionsDataProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Question',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Text('Most Voted', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                _buildQuestionsList(Mode.MOST_VOTED),
                SizedBox(height: 30),
                Text('Most Recent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                _buildQuestionsList(Mode.MOST_RECENT),
                SizedBox(height: 30),
                Text('All', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                _buildQuestionsList(Mode.ALL),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Aquí puedes añadir un método para crear una nueva pregunta
        },
      ),
    );
  }

  Widget _buildQuestionsList(Mode mode) {
    var theme = Theme.of(context).colorScheme;
    final colors = [
      theme.primaryContainer,
      theme.background,
      theme.secondaryContainer,
      theme.tertiaryContainer
    ];
    return FutureBuilder<List<Question>>(
      future: _questionsDataProvider.fetchAllQuestions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        final allQuestions = snapshot.data!;
        List<Question> questions;
        switch(mode) {
          case Mode.MOST_VOTED:
            questions = allQuestions.where((q) => q.likes.length > 0).toList() // Filtrar preguntas con más de 0 likes
              ..sort((a, b) => b.likes.length.compareTo(a.likes.length));
            questions = questions.take(5).toList();
            break;
          case Mode.MOST_RECENT:
            questions = allQuestions..sort((a, b) => b.timestamp.compareTo(a.timestamp));
            questions = questions.take(5).toList();
            break;
          case Mode.ALL:
          default:
            questions = allQuestions;
            break;
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            final isLikedByUser = question.likes.contains(userId);
            return Card(
              color: colors[index % colors.length],
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              child: ListTile(
                title: Text(question.content),
                subtitle: Text(
                  question.answer,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(question.likes.length.toString()),  // Muestra la cantidad de "likes"
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: isLikedByUser ? Colors.red : Colors.grey, 
                      ),
                      onPressed: () async {
                        if (isLikedByUser) {
                          question.likes.remove(userId);
                        } else {
                          question.likes.add(userId);
                        }
                        await _questionsDataProvider.updateLikes(question.id, question.likes);
                        setState(() {});
                      },
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionDetail(question: question),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

enum Mode { MOST_VOTED, MOST_RECENT, ALL }
