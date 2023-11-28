import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';

//To Do
//Obtener todos los To Do items de un usuario en especifico
Future<List<ToDo>> fetchToDos() async {
  List<ToDo> toDos = [];

  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user != null) {
      String uid = user.uid;
      print('TURBIO');
      print(uid);

      QuerySnapshot toDoQuerySnapshot = await FirebaseFirestore.instance
          .collection('todos')
          .where('user', isEqualTo: uid)
          .get();

      for (QueryDocumentSnapshot doc in toDoQuerySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        String relatedPetId = data['relatedPetId'];

        // Busca la mascota correspondiente en Firestore
        Pet? relatedPet = await fetchPetById(relatedPetId);

        if (relatedPet != null) {
          // Convierte el campo 'activityType' de String a ActivityType
          ActivityType activityType = ActivityType.values.firstWhere(
            (type) => type.toString() == 'ActivityType.${data['activityType']}',
            orElse: () => ActivityType
                .bath, // Valor predeterminado en caso de no coincidir
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
                activityType: activityType,
                completed: data['completed'],
                user: uid),
          );
        }
      }
    }
  });

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
          content: Text("Error at updating: $error"),
          backgroundColor: Colors.red,
        ),
      );
      throw error;
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("The document doesn't exist"),
        backgroundColor: Colors.red,
      ),
    );
    throw Exception("The document doesn't exist");
  }
}

//Añadir elemento
Future<void> addToDo(ToDo toDo) async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
    if (user != null) {
      String uid = user.uid;
      print('TURBIO');
      print(uid);

      CollectionReference todos =
          FirebaseFirestore.instance.collection('todos');
      try {
        await todos.add({
          'date': toDo.date,
          'time': '${toDo.time.hour}:${toDo.time.minute}',
          'activityName': toDo.activityName,
          'relatedPetId': toDo.relatedPet.id,
          'activityType': toDo.activityType.toString().split('.').last,
          'completed': toDo.completed,
          'user': uid
        });
      } catch (error) {
        rethrow;
      }
    }
  });
}
