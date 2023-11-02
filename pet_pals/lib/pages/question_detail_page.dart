import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pet_pals/models/question.dart';
import 'package:pet_pals/models/user.dart';
import 'package:pet_pals/providers/data_provider_questions.dart';
import 'package:pet_pals/providers/data_provider_users.dart';
import 'package:pet_pals/models/comment.dart';

class QuestionDetail extends StatefulWidget {
  final Question question;

  QuestionDetail({required this.question});

  @override
  _QuestionDetailState createState() => _QuestionDetailState();
}

class _QuestionDetailState extends State<QuestionDetail> {
  final QuestionsDataProvider _questionsProvider = QuestionsDataProvider();
  final UsersDataProvider _usersProvider = UsersDataProvider();
  
  List<Comment> _comments = []; 

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  _loadComments() async {
    if (widget.question.comments.isNotEmpty) {
      for (String commentId in widget.question.comments) {
        DocumentSnapshot doc = await _questionsProvider.commentsCollection.doc(commentId).get();
        Comment comment = Comment.fromFirestore(doc);
        setState(() {
          _comments.add(comment);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question Details"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Sección que muestra la pregunta en un Card:
            Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.question.content,  // Asumo que tienes un campo 'title' en tu modelo de Question.
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(widget.question.content), // Asumo que tienes un campo 'content' en tu modelo de Question.
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),

            // Sección de comentarios:
            if (_comments.isEmpty) 
              Text("No comments")
            else 
              ..._comments.map((comment) => FutureBuilder<User>(
                future: _usersProvider.getUserById(comment.userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                    User user = snapshot.data!;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.image),
                      ),
                      title: Text(user.name),
                      subtitle: Text(comment.content),
                      trailing: Text(comment.timestamp.toString()),
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Text('Error loading comment');
                  }
                },
              )).toList(),
              
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: Text("Write a Comment"),
            ),
          ],
        ),
      ),
    );
  }
}
