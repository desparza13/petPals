import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';

class MyPetPage extends StatelessWidget {
  MyPetPage({super.key, required this.pet});
  final Pet pet;
  final colors = [
    Color(0xFFFFDE59),
    Color(0xFFDFD2C8),
    Color(0xFFC0F6FF),
    Color(0xFFBBFFAD)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8F4152)
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height /2.7,
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                  'https://mvsnoticias.com/u/fotografias/m/2023/4/19/f960x540-533922_607997_15.jpg',
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height/3,
                bottom: 0,
                left: 0,
                right: 0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(pet.name)
                  ]),
              ),
            ))
        ],
      ),
    );
  }
}