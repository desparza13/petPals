import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_pals/models/question.dart';
import 'package:pet_pals/providers/data_provider_questions.dart';

class QAPage extends StatefulWidget {
  @override
  _QandAPageState createState() => _QandAPageState();
}

class _QandAPageState extends State<QAPage> {
  late QuestionsDataProvider _questionsDataProvider;

  @override
  void initState() {
    super.initState();
    _questionsDataProvider = QuestionsDataProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Q&A"),
      ),
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
                _buildQuestionsList(),
                Text('Most Recent', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                _buildQuestionsList(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
        },
      ),
    );
  }

  Widget _buildQuestionsList() {
    var theme = Theme.of(context).colorScheme;
    final colors = [
      theme.primaryContainer,
      Color(0xFFDFD2C8),
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
        final questions = snapshot.data!;
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Card(
              color: colors[index % colors.length], // Selecciona el color basado en el índice
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              elevation: 5,
              child: ListTile(
                title: Text(question.content),
                subtitle: Text(
                  question.answer,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: Icon(Icons.favorite, color: question.likes.isNotEmpty ? Colors.red : null),
                onTap: () {
                },
              ),
            );
          },
        );
      },
    );
  }
}
