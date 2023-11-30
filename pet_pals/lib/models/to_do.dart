import 'package:flutter/material.dart';
import 'pet.dart';

enum ActivityType {
  bath, // bañar
  eat, // comer
  medicine, // medicina
  vaccine, // vacuna
  vet, // veterinario
  walk, // pasear
  play // jugar
}

class ToDo {
  final String id;
  final DateTime date;
  final TimeOfDay time;
  final String activityName;
  final Pet relatedPet;
  final ActivityType activityType;
  bool completed;
  final String user;

  ToDo({
    required this.id,
    required this.date,
    required this.time,
    required this.activityName,
    required this.relatedPet,
    required this.activityType,
    this.completed = false,
    required this.user
  });
}
