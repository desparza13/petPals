import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/widgets/info_my_pet_widget.dart';

class MyPetPage extends StatelessWidget {
  MyPetPage({super.key, required this.pet});
  final Pet pet;
  final _colors = [
    Color(0xFFFFDE59),
    Color(0xFFDFD2C8),
    Color(0xFFC0F6FF),
    Color(0xFFBBFFAD)
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF8F4152)),
      body: Stack(
        children: [
          //Imagen de la mascota
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              child: Image.network(pet.image, fit: BoxFit.fill),
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 3,
              bottom: 0,
              left: 0,
              right: 0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
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
                    //Widget para mostrar la información de la mascota en containers
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InfoMyPetWidget(pet: pet, colors: _colors),
                    ),
                    const SizedBox(
                      height: 130,
                    ),
                    //Botón de editar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //Redirigir a editar

                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            fixedSize: const Size(60, 60)
                          ),
                          child: const Icon(Icons.border_color_outlined),
                        )
                      ],
                    )
                  ]),
                ),
              ))
        ],
      ),
    );
  }
}
