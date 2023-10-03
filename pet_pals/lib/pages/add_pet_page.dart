import 'package:flutter/material.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';

class AddPetPage extends StatefulWidget {
  const AddPetPage({super.key});

  @override
  State<AddPetPage> createState() => _AddPetPageState();
}

class _AddPetPageState extends State<AddPetPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> _sex = ['Female', 'Male'];
  String _sexSelected = 'Female';
  final List<String> _sterilized = ['Yes', 'No'];
  String _sterilizedSelected = 'No';

  InputDecoration getInputDecoration({required String hint}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      fillColor: Colors.white,
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
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: const Color.fromARGB(255, 255, 203, 220),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: 100,
            bottom: 600,
            left: 120,
            right: 120,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.camera_enhance),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Add Photo'),
                ],
              ),
            ),
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
                        decoration: getInputDecoration(hint: 'Name'),
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
                        decoration: getInputDecoration(hint: 'Type'),
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
                        decoration: getInputDecoration(hint: 'Breed'),
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
                        decoration: getInputDecoration(hint: 'Age'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Color'),
                        ],
                      ),
                      TextFormField(
                        decoration: getInputDecoration(hint: 'Color'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Sterilized'),
                        ],
                      ),
                      DropdownButtonFormField<String>(
                        decoration: getInputDecoration(hint: 'sterilized'),
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
                              onPressed: () {
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
