import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/pages/add_image.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';

class EditMyPetPage extends StatefulWidget {
  const EditMyPetPage({super.key, required this.pet});
  final Pet pet;

  @override
  State<EditMyPetPage> createState() => _EditMyPetPageState();
}

class _EditMyPetPageState extends State<EditMyPetPage> {
  List<String> _sex = ['Female', 'Male','No selected'];

  String _sexSelected = 'No selected';

  InputDecoration getInputDecoration({required String hint}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      filled: true,
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Color(0xFFEE8454)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Color(0xFF5E17EB)),
      ),
    );
  }

  @override

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit my pet'),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: FutureBuilder<Uint8List>(
                      future: getFirebaseImage(widget.pet.image),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Image.asset(
                            "assets/images/icons/paws.png",
                            fit: BoxFit.cover,
                          );
                        } else {
                          return Image.memory(snapshot.data!,
                              width: double.infinity, height: double.infinity, fit: BoxFit.cover,);
                        }
                      }),
            ),
          ),
          Positioned(
            top: 100,
            bottom: 600,
            left: 115,
            right: 100,
            child: AddImage()
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 4,
              bottom: 0,
              left: 0,
              right: 0,
              child: SingleChildScrollView(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Name'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: widget.pet.name),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Type'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: widget.pet.type),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Breed'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: widget.pet.breed),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Sex'),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        decoration: getInputDecoration(hint: 'Sex'),
                        value: _sexSelected,
                        items: _sex.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (Object? value) {},
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Age'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: widget.pet.age.toString()),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Color'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: widget.pet.color),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Sterilized'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: widget.pet.sterilized==true?'Yes':'No'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              }, child: Text('Edit pet'))
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
