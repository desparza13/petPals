import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id; // ID único del comentario
  final String content; // Contenido del comentario
  final String userId; // ID del usuario que hizo el comentario
  final DateTime timestamp; // Fecha y hora de creación del comentario
  final String questionId;

  Comment({
    required this.id,
    required this.content,
    required this.userId,
    required this.timestamp,
    required this.questionId
  });

  // Conversión de un documento Firestore a una instancia de Comment
  factory Comment.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Comment(
      id: doc.id,
      content: data['content'],
      userId: data['userId'],
      timestamp: data['timestamp'].toDate(),
      questionId: data['questionId']
    );
  }

  // Conversión de una instancia de Comment a un mapa para Firestore
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'userId': userId,
      'timestamp': timestamp,
      'questionId': questionId
    };
  }
}
