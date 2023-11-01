import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Pets
//Obtener todas las mascotas de un usuario
Future<List<Pet>> fetchPets(String userId) async {
  QuerySnapshot petQuerySnapshot = await FirebaseFirestore.instance
      .collection('pets')
      .where('propietario', isEqualTo: userId)
      .get();

  List<Pet> pets = petQuerySnapshot.docs.map((doc) {
    Map<String, dynamic> petData = doc.data() as Map<String, dynamic>;
    return Pet(
      name: petData['name'],
      location: petData['location'],
      type: petData['type'],
      breed: petData['breed'],
      age: petData['age'],
      sex: petData['sex'],
      color: petData['color'],
      sterilized: petData['sterilized'],
      image: petData['image'],
      size: petData['size'] ?? '',
      propietario: petData['propietario'],
      inAdoption: petData['inAdoption'],
    );
  }).toList();

  return pets;
}

//Obtener una mascota en especifico de acuerdo a su ID
Future<Pet?> fetchPetById(String petId) async {
  DocumentSnapshot petDoc =
      await FirebaseFirestore.instance.collection('pets').doc(petId).get();

  if (petDoc.exists) {
    Map<String, dynamic> petData = petDoc.data() as Map<String, dynamic>;
    return Pet(
        name: petData['name'],
        location: petData['location'],
        type: petData['type'],
        breed: petData['breed'],
        age: petData['age'],
        sex: petData['sex'],
        color: petData['color'],
        sterilized: petData['sterilized'],
        image: petData['image'],
        size: petData['size'] ?? '',
        propietario: petData['propietario'],
        inAdoption: petData['inAdoption']);
  } else {
    return null; // Devuelve null si no se encuentra la mascota
  }
}

//Obtener todas las mascotas que están en adopción
Future<List<Pet>> fetchPetsInAdoption() async {
  QuerySnapshot petQuerySnapshot = await FirebaseFirestore.instance
      .collection('pets')
      .where('inAdoption', isEqualTo: true)
      .get();

  List<Pet> pets = [];

  for (DocumentSnapshot doc in petQuerySnapshot.docs) {
    Map<String, dynamic> petData = doc.data() as Map<String, dynamic>;
    pets.add(Pet(
        name: petData['name'],
        location: petData['location'],
        type: petData['type'],
        breed: petData['breed'],
        age: petData['age'],
        sex: petData['sex'],
        color: petData['color'],
        sterilized: petData['sterilized'],
        image: petData['image'],
        size: petData['size'] ?? '',
        propietario: petData['propietario'],
        inAdoption: petData['inAdoption']));
  }

  return pets;
}
