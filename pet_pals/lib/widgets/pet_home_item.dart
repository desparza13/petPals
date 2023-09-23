import 'package:flutter/material.dart';
import '../models/pet.dart';

class PetHomeItem extends StatelessWidget {
  final Pet pet;
  final Color color;

  PetHomeItem({required this.pet, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: color,
      ),
      child: Stack(
        children: [
          // Margen de 15px alrededor de la foto para que se aprecie el color
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.network(
                pet.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          // Fondo semi transparente en la parte inferior de la imagen (no se si ponerlo sin opacidad)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65, 
              width: double.infinity,
              decoration: BoxDecoration(
                //Redondear solo abajo
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                color: color.withOpacity(0.85),  // Menos opacidad
              ),
            ),
          ),
          // Nombre y breed de la mascota posicionados encima del fondo
          Positioned(
            bottom: 25,  
            left: 20,  
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,  
              children: [
                Text(
                  pet.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Text(
                  pet.breed,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
