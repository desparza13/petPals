import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _storage = FirebaseStorage.instance;

//Pets
//Obtener todas las mascotas de un usuario
Future<List<Pet>> fetchPets() async {
  List<Pet> pets = [];
  String uid = FirebaseAuth.instance.currentUser!.uid;
  print('AAAAAAAAAAA');
  print(uid);

  QuerySnapshot petQuerySnapshot = await FirebaseFirestore.instance
      .collection('pets')
      .where('propietario', isEqualTo: uid)
      .get();

  pets = petQuerySnapshot.docs.map((doc) {
    Map<String, dynamic> petData = doc.data() as Map<String, dynamic>;
    
    return Pet(
      id: doc.id,
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
        id: petDoc.id,
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
        id: doc.id,
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

Future<List<Pet>> fetchPetsByType(String type) async {
  QuerySnapshot snapshot;
  if (type != 'All') {
      snapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('type', isEqualTo: type)
          .where('inAdoption', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => Pet.fromDocument(doc)).toList();
    } 
    else {
      snapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('inAdoption', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => Pet.fromDocument(doc)).toList();  
  }
}

//Añadir mascota
Future<void> addPet(Pet pet, File? selectedImage) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  var path;

  //Asignar path dependiendo la imagen
  if (selectedImage != null) {
    var listPath = selectedImage.path.split('/');
    path = listPath[listPath.length - 1];
    final storageRef = _storage.ref();
    storageRef.child("pets/$path").putFile(selectedImage);
  } else {
    path = 'paws.png'; //En caso de que no haya foto, se pone la default
  }

  CollectionReference pets = FirebaseFirestore.instance.collection('pets');
  try {

    await pets.add({
      'name': pet.name,
      'location': pet.location,
      'type': pet.type,
      'breed': pet.breed,
      'age': pet.age,
      'sex': pet.sex,
      'color': pet.color,
      'sterilized': pet.sterilized,
      'image': 'pets/$path',
      'propietario': uid,
      'inAdoption': pet.inAdoption,
      'size': pet.size
    });
  } catch (error) {
    rethrow;
  }
}

//Editar mascota
Future<void> editPet(String petId,Pet pet, File? selectedImage) async {
  String uid = FirebaseAuth.instance.currentUser!.uid;
  var path;

  //Asignar path dependiendo la imagen
  if (selectedImage != null) {
    var listPath = selectedImage.path.split('/');
    path = listPath[listPath.length - 1];
    final storageRef = _storage.ref();
    storageRef.child("pets/$path").putFile(selectedImage);
  } else {
    path = 'paws.png'; //En caso de que no haya foto, se pone la default
  }

  CollectionReference pets = FirebaseFirestore.instance.collection('pets');
  try {
    await pets.doc(petId).update({
      'name': pet.name,
      'location': pet.location,
      'type': pet.type,
      'breed': pet.breed,
      'age': pet.age,
      'sex': pet.sex,
      'color': pet.color,
      'sterilized': pet.sterilized,
      'image': 'pets/$path',
      'propietario': uid,
      'inAdoption': pet.inAdoption,
      'size': pet.size
    });
  } catch (error) {
    rethrow;
  }
}

Future<Uint8List> getFirebaseImage(String path) async {
  final storageRef = _storage.refFromURL('gs://petpals-9935f.appspot.com');
  var imageRef = storageRef.child(path);
  const res = 1024 * 1024;
  Uint8List? data = await imageRef.getData(res);
  if (data == null) {
    var imageRef = storageRef.child("pets/paws.png");
    data = await imageRef.getData(res);
    return data!;
  }
  return data;
}
