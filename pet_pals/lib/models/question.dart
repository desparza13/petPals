import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final String id; // ID 
  final String content; // pregunta
  final String answer; // respuesta
  final List<String> likes; // Lista de IDs de usuarios que dieron 'like' a la respuesta
  final List<String> comments; // Lista de IDs de comentarios relacionados a la pregunta
  final DateTime timestamp; // Fecha y hora de la creación de la pregunta

  Question({
    required this.id,
    required this.content,
    required this.answer,
    required this.likes,
    required this.comments,
    required this.timestamp,
  });

  // Conversión de un documento Firestore a una instancia de Question
  factory Question.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Question(
      id: doc.id,
      content: data['content'],
      answer: data['answer'],
      likes: List<String>.from(data['likes']),
      comments: List<String>.from(data['comments']),
      timestamp: data['timestamp'].toDate(),
    );
  }

  // Conversión de una instancia de Question a un mapa para Firestore
  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'answer': answer,
      'likes': likes,
      'comments': comments,
      'timestamp': timestamp,
    };
  }
}
