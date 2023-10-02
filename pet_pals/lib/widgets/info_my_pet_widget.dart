import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';

class InfoMyPetWidget extends StatelessWidget {
  const InfoMyPetWidget({super.key, required this.pet, required this.colors,});
  final Pet pet;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors[0], borderRadius: BorderRadius.circular(15)),
          width: MediaQuery.of(context).size.width / 5,
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Text('age',style: TextStyle(fontWeight: FontWeight.bold)), 
            Text(pet.age.toString()), Text('years')],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: colors[1], borderRadius: BorderRadius.circular(15)),
          width: MediaQuery.of(context).size.width / 5,
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('sex', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(pet.sex == 'Male' ? Icons.male : Icons.female)
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: colors[2], borderRadius: BorderRadius.circular(15)),
          width: MediaQuery.of(context).size.width / 5,
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'color',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(pet.color, textAlign: TextAlign.center,)
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: colors[3], borderRadius: BorderRadius.circular(15)),
          width: MediaQuery.of(context).size.width / 5,
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('sterilized', style: TextStyle(fontWeight: FontWeight.bold)),
              Icon(pet.sterilized == true ? Icons.check : Icons.cancel)
            ],
          ),
        ),
      ],
    );
  }
}
