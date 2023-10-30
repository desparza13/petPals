import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/widgets/owner_widget.dart';

class AdoptionPetPage extends StatelessWidget {
  const AdoptionPetPage({super.key, required this.pet});
  final Pet pet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(
        children: [
          //Imagen de la mascota
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: Image.network(pet.image, fit: BoxFit.fill),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 3.5,
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Text(
                        pet.name,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF8F4152)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    children: [
                                      Icon(Icons.location_pin,
                                          size: 35,
                                          color:
                                              Color.fromARGB(255, 245, 190, 138)),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text('Location'),
                                      Text(
                                        pet.location,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  const Column(
                                    children: [
                                      Icon(Icons.pets,
                                          size: 35,
                                          color:
                                              Color.fromARGB(255, 245, 190, 138)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(pet.type),
                                        Text(
                                          pet.breed,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      // mostrar la información de la mascota en containers
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 186, 186, 186),
                                borderRadius: BorderRadius.circular(15)),
                            width: MediaQuery.of(context).size.width / 5,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('age',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(pet.age.toString()), Text(' years')
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 186, 186, 186),
                                borderRadius: BorderRadius.circular(15)),
                            width: MediaQuery.of(context).size.width / 5,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('sex',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Icon(
                                    pet.sex == 'Male' ? Icons.male : Icons.female)
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 186, 186, 186),
                                borderRadius: BorderRadius.circular(15)),
                            width: MediaQuery.of(context).size.width / 5,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'color',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  pet.color,
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 186, 186, 186),
                                borderRadius: BorderRadius.circular(15)),
                            width: MediaQuery.of(context).size.width / 5,
                            height: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('size',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(pet.size)
                              ],
                            ),
                          ),
                        ],
                      ),
                      //Mostrar información del dueño
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: OwnerWidget(),
                      ),
                      //Botón de adopción
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            }, 
                            child: Text('Adoption'))
                        ],
                      )
                    ]),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
