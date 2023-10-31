import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../widgets/menu_drawer_widget.dart';
import '../widgets/pet_home_item.dart';
import '../widgets/to_do_home_widget.dart';
import '../widgets/app_bar_widget.dart';
import 'package:pet_pals/providers/data_provider.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final colors = [
    Color(0xFFFFDE59),
    Color(0xFFDFD2C8),
    Color(0xFFC0F6FF),
    Color(0xFFBBFFAD)
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search pet',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD8B1),
                borderRadius: BorderRadius.circular(45),
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hi Jenny!',
                        style: TextStyle(
                            color: Color(0xFF8F4152),
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Welcome back',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/woman_home.png',
                    width: 180,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xFFF4F4F4),
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your pets',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  FutureBuilder<List<Pet>>(
                    future: fetchPets('ejemplo'), 
                    builder: (BuildContext context, AsyncSnapshot<List<Pet>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No Pets Found'));
                      }
                      List<Pet> pets = snapshot.data!;
                      return Container(
                        height: 200,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: pets.length,
                          separatorBuilder: (context, index) => const SizedBox(width: 10),
                          itemBuilder: (context, index) {
                            Pet pet = pets[index];
                            return PetHomeItem(
                              pet: pet,
                              color: colors[index % colors.length],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ToDoHomeWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
