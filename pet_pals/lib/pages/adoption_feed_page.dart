import 'package:flutter/material.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';
import 'package:pet_pals/widgets/pet_adoption_item.dart';
import 'package:pet_pals/widgets/pets_bar_widget.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';
import 'package:pet_pals/models/pet.dart';

class AdoptionFeedPage extends StatefulWidget {
  const AdoptionFeedPage({super.key});

  @override
  State<AdoptionFeedPage> createState() => _AdoptionFeedPageState();
}

class _AdoptionFeedPageState extends State<AdoptionFeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _colors = const [
    Color(0xFFFFDE59),
    Color(0xFFDFD2C8),
    Color(0xFFC0F6FF),
    Color(0xFFBBFFAD)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Location
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(Icons.location_pin, size: 40, color: Color.fromARGB(255, 245, 190, 138)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Location',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Guadalajara, Jalisco',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            Card(
              color: const Color.fromARGB(255, 236, 221, 248),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const ListTile(
                    title: Text(
                      "Let's start the adoption!",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text('Find your lovely pet'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search pet',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: PetsBarWidget(),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    child: FutureBuilder<List<Pet>>(
                      future: fetchPetsInAdoption(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No pets available for adoption'));
                        } else {
                          List<Pet> pets = snapshot.data!;
                          return ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: pets.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              return PetAdoptionItem(
                                pet: pets[index],
                                color: _colors[index % _colors.length],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
