import 'package:flutter/material.dart';
import 'package:pet_pals/models/to_do.dart';
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

//To Do
//Obtener todos los To Do items de un usuario en especifico
Future<List<ToDo>> fetchToDos(String userId) async {
  QuerySnapshot toDoQuerySnapshot = await FirebaseFirestore.instance
      .collection('todos')
      .where('user', isEqualTo: userId)
      .get();

  List<ToDo> toDos = [];

  for (QueryDocumentSnapshot doc in toDoQuerySnapshot.docs) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    String relatedPetId = data['relatedPetId'];

    // Busca la mascota correspondiente en Firestore
    Pet? relatedPet = await fetchPetById(relatedPetId);

    if (relatedPet != null) {
      // Convierte el campo 'activityType' de String a ActivityType
      ActivityType activityType = ActivityType.values.firstWhere(
        (type) => type.toString() == 'ActivityType.${data['activityType']}',
        orElse: () =>
            ActivityType.bath, // Valor predeterminado en caso de no coincidir
      );

      toDos.add(
        ToDo(
          id: doc.id,
          date: data['date'].toDate(),
          time: TimeOfDay(
            hour: int.parse(data['time'].split(':')[0]),
            minute: int.parse(data['time'].split(':')[1]),
          ),
          activityName: data['activityName'],
          relatedPet: relatedPet,
          activityType: activityType, // Usa la conversión realizada aquí
          completed: data['completed'],
        ),
      );
    }
  }

  return toDos;
}

//Cambiar entre completo y no completo
Future<void> toggleToDoCompletion(BuildContext context, String taskId) async {
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');
  DocumentSnapshot document = await todos.doc(taskId).get();

  if (document.exists) {
    bool currentStatus = document['completed'];

    // Cambia el estado de completed al opuesto
    return todos.doc(taskId).update({
      'completed': !currentStatus,
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error al actualizar la tarea: $error"),
          backgroundColor: Colors.red,
        ),
      );
      throw error;
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("El documento no existe"),
        backgroundColor: Colors.red,
      ),
    );
    throw Exception("El documento no existe");
  }
}

