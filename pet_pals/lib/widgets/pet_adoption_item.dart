import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/pages/adoption_pet_page.dart';

class PetAdoptionItem extends StatelessWidget {
  const PetAdoptionItem({super.key, required this.pet, required this.color});
  final Pet pet;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                const SizedBox(
                  width: 150,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pet.name,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [Text(pet.age.toString()), Text(' years')],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color.fromARGB(255, 255, 212, 152),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(pet.breed),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color.fromARGB(255, 179, 220, 180),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(pet.sex),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 210, 238, 240),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text(pet.type),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AdoptionPetPage(
                                          pet: pet,
                                        )));
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              backgroundColor:theme.secondary,
                              foregroundColor: theme.onSecondary),
                              
                          child: Text(
                            'Info',
                            style: TextStyle(fontSize: 11),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          width: 150,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                pet.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
