import 'package:flutter/material.dart';
import 'package:pet_pals/models/to_do.dart';
import 'package:pet_pals/dummy_data/dummy_pets.dart';

List<ToDo> dummyToDos = [
  ToDo(
    id: 1,
    date: DateTime.now().add(Duration(days: 1)),
    time: TimeOfDay(hour: 8, minute: 30),
    activityName: 'Morning Walk',
    relatedPet: dummyPets[0],  // Beau
    activityType: ActivityType.walk,
    completed: false
  ),
  ToDo(
    id: 2,
    date: DateTime.now().add(Duration(days: 2)),
    time: TimeOfDay(hour: 9, minute: 0),
    activityName: 'Vet Checkup',
    relatedPet: dummyPets[1],  // Kebo
    activityType: ActivityType.vet,
    completed: false
  ),
  ToDo(
    id: 3,
    date: DateTime.now().add(Duration(days: 1)),
    time: TimeOfDay(hour: 18, minute: 30),
    activityName: 'Play Time',
    relatedPet: dummyPets[2],  // Nia
    activityType: ActivityType.play,
    completed: false
  ),
  ToDo(
    id:4,
    date: DateTime.now().add(Duration(days: 4)),
    time: TimeOfDay(hour: 12, minute: 0),
    activityName: 'Afternoon Walk',
    relatedPet: dummyPets[3],  // Tipsy
    activityType: ActivityType.walk,
    completed: false
  ),
  ToDo(
    id:5,
    date: DateTime.now().add(Duration(days: 2)),
    time: TimeOfDay(hour: 20, minute: 0),
    activityName: 'Medication',
    relatedPet: dummyPets[1],  // Kebo
    activityType: ActivityType.medicine,
    completed: false
  ),
  ToDo(
    id: 6,
    date: DateTime.now().add(Duration(days: 5)),
    time: TimeOfDay(hour: 8, minute: 15),
    activityName: 'Morning Walk',
    relatedPet: dummyPets[4],  // Buddy
    activityType: ActivityType.walk,
    completed: false
  ),
  ToDo(
    id: 7,
    date: DateTime.now().add(Duration(days: 3)),
    time: TimeOfDay(hour: 10, minute: 30),
    activityName: 'Vaccine',
    relatedPet: dummyPets[2],  // Nia
    activityType: ActivityType.vaccine,
    completed: false
  ),
  ToDo(
    id:8,
    date: DateTime.now().add(Duration(days: 6)),
    time: TimeOfDay(hour: 14, minute: 45),
    activityName: 'Eat Time',
    relatedPet: dummyPets[0],  // Beau
    activityType: ActivityType.eat,
    completed: false
  ),
  ToDo(
    id:9,
    date: DateTime.now().add(Duration(days: 7)),
    time: TimeOfDay(hour: 15, minute: 30),
    activityName: 'Play Time',
    relatedPet: dummyPets[3],  // Tipsy
    activityType: ActivityType.play,
    completed: false
  ),
  ToDo(
    id: 10,
    date: DateTime.now().add(Duration(days: 8)),
    time: TimeOfDay(hour: 9, minute: 45),
    activityName: 'Bath Time',
    relatedPet: dummyPets[4],  // Buddy
    activityType: ActivityType.bath,
    completed: false
  ),
];
