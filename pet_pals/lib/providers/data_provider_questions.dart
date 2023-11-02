import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_pals/models/question.dart';
import 'package:pet_pals/models/comment.dart';

class QuestionsDataProvider {
  final CollectionReference questionsCollection = FirebaseFirestore.instance.collection('questions');
  final CollectionReference commentsCollection = FirebaseFirestore.instance.collection('comments');

  // Obtener todas las preguntas
  Future<List<Question>> fetchAllQuestions() async {
    QuerySnapshot querySnapshot = await questionsCollection.get();
    return querySnapshot.docs.map((doc) => Question.fromFirestore(doc)).toList();
  }

  // Agregar una nueva pregunta
  Future<void> addQuestion(Question question) async {
    await questionsCollection.add(question.toMap());
  }

  // Actualizar la respuesta de una pregunta
  Future<void> updateAnswer(String questionId, String answer) async {
    await questionsCollection.doc(questionId).update({'answer': answer});
  }

  // Dar 'like' a una respuesta
  Future<void> likeAnswer(String questionId, String userId) async {
    DocumentSnapshot doc = await questionsCollection.doc(questionId).get();
    if (doc.exists) {
      Map<String, dynamic> docData = doc.data() as Map<String, dynamic>;
      List<String> currentLikes = List<String>.from(docData['likes'] ?? []);
        if (!currentLikes.contains(userId)) { // Asegura que un usuario solo puede dar 'like' una vez
        currentLikes.add(userId);
        await questionsCollection.doc(questionId).update({'likes': currentLikes});
      }
    }
  }

  // Agregar un comentario a una pregunta
  Future<void> addComment(String questionId, String commentContent, String userId) async {
    DocumentReference commentRef = await commentsCollection.add({
      'content': commentContent,
      'userId': userId,
      'timestamp': Timestamp.now(),
    });

    DocumentSnapshot questionDoc = await questionsCollection.doc(questionId).get();
    if (questionDoc.exists) {
        Map<String, dynamic> questionDocData = questionDoc.data() as Map<String, dynamic>;
      List<String> currentComments = List<String>.from(questionDocData['comments'] ?? []);
      currentComments.add(commentRef.id);
      await questionsCollection.doc(questionId).update({'comments': currentComments});
    }
  }
}
