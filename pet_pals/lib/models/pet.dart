import 'package:cloud_firestore/cloud_firestore.dart';
//Modelo para las mascotas

class Pet {
  final String id;
  final String name;
  final String location;
  final String type;
  final String breed;
  final int age;
  final String sex;
  final String color;
  final bool sterilized;
  final String image;
  final String propietario;
  final bool inAdoption;
  String size;

  Pet({
    required this.id,
    required this.name,
    required this.location,
    required this.type,
    required this.breed,
    required this.age,
    required this.sex,
    required this.color,
    required this.sterilized,
    required this.image,
    required this.propietario,
    this.inAdoption = false,
    this.size = '',
  });

  factory Pet.fromDocument(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Pet(
      id: doc.id,
      name: data['name'],
      location: data['location'],
      type: data['type'],
      breed: data['breed'],
      age: data['age'],
      sex: data['sex'],
      color: data['color'],
      sterilized: data['sterilized'],
      image: data['image'],
      propietario: data['propietario'],
      inAdoption: data['inAdoption'],
      size: data['size'] ?? '',
    );
  }
}
