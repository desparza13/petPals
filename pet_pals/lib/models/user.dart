import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String lastname;
  final String email;
  final String city;
  final String image;
  final String number;

  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.email,
    required this.city,
    required this.image,
    required this.number,
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return User(
      id: doc.id,
      name: data['name'],
      lastname: data['lastname'],
      email: data['email'],
      city: data['city'],
      image: data['image'],
      number: data['number'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'city': city,
      'image': image,
      'number': number,
    };
  }
}
