import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Pets
//Obtener todas las mascotas de un usuario
Future<List<Pet>> fetchPets() async {
  List<Pet> pets = [];
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user != null) {
      String uid = user.uid;
      print('TURBIO');
      print(uid);

      QuerySnapshot petQuerySnapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('propietario', isEqualTo: uid)
          .get();

      List<Pet> pets = petQuerySnapshot.docs.map((doc) {
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
    }
  });

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

//Añadir mascota
Future<void> addPet(Pet pet) async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user != null) {
      String uid = '';
      uid = user.uid;
      
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
          'image': pet.image,
          'propietario': uid,
          'inAdoption': pet.inAdoption,
          'size': pet.size
        });
      } catch (error) {
        rethrow;
      }
    }
  });
}
