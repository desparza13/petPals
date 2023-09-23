//Modelo para las mascotas

class Pet {
  final String name;
  final String location;
  final String type;
  final String breed;
  final int age;
  final String sex;
  final String color;
  final bool sterilized;
  final String image;  

  Pet({
    required this.name,
    required this.location,
    required this.type,
    required this.breed,
    required this.age,
    required this.sex,
    required this.color,
    required this.sterilized,
    required this.image, 
  });

}
