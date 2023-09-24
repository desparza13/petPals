// models/to_do.dart

import 'package:flutter/material.dart';
import 'pet.dart';

enum ActivityType {
  bath,     // bañar
  eat,      // comer
  medicine, // medicina
  vaccine,  // vacuna
  vet,      // veterinario
  walk,     // pasear
  play      // jugar
}

class ToDo {
  final DateTime date;
  final TimeOfDay time;
  final String activityName;
  final Pet relatedPet;
  final ActivityType activityType;
  bool completed;

  ToDo({
    required this.date,
    required this.time,
    required this.activityName,
    required this.relatedPet,
    required this.activityType,
    this.completed = false,
  });
}
