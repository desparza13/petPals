import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pet_pals/models/pet.dart';
import 'package:pet_pals/pages/add_image.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';
import 'package:pet_pals/providers/gallery_provider.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';
import 'package:provider/provider.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final List<String> _sex = ['Female', 'Male'];
  String _sexSelected = 'Female';
  final List<String> _sterilized = ['Yes', 'No'];
  String _sterilizedSelected = 'No';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: theme.colorScheme.secondary,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
              top: 0, bottom: 500, left: 0, right: 0, child: AddImage()),
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
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            hintText: 'Name', labelText: 'Name'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: typeController,
                        decoration: const InputDecoration(
                            hintText: 'Type', labelText: 'Type'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: breedController,
                        decoration: InputDecoration(
                            hintText: 'Breed', labelText: 'Breed'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Sex'),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        value: _sexSelected,
                        items: _sex.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _sexSelected = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: ageController,
                        decoration:
                            InputDecoration(hintText: 'Age', labelText: 'Age'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: colorController,
                        decoration: InputDecoration(
                            hintText: 'Color', labelText: 'Color'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                            hintText: 'Location', labelText: 'Location'),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Sterilized'),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        value: _sterilizedSelected,
                        items: _sterilized.map((option) {
                          return DropdownMenuItem<String>(
                            value: option,
                            child: Text(option),
                          );
                        }).toList(),
                        onChanged: (Object? value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colorScheme.primary,
                                  foregroundColor: theme.colorScheme.onPrimary),
                              onPressed: () async {
                                File? selectedImage;
                                selectedImage = Provider.of<GalleryProvider>(
                                        context,
                                        listen: false)
                                    .file;

                                final newPet = Pet(
                                    name: nameController.text,
                                    type: typeController.text,
                                    breed: breedController.text,
                                    sex: _sexSelected,
                                    age: int.parse(ageController.text),
                                    color: colorController.text,
                                    sterilized: _sterilizedSelected == 'Yes'
                                        ? true
                                        : false,
                                    location: locationController.text,
                                    propietario: '',
                                    image: '',
                                    inAdoption: false);
                                try {
                                  await addPet(newPet, selectedImage);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text('Pet added successfully'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } catch (error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Error adding pet. Please try again.'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                }
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNavBar()));
                              },
                              child: Text('Add pet'))
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
