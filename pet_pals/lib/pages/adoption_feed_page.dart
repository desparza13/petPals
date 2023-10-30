import 'package:flutter/material.dart';
import 'package:pet_pals/dummy_data/dummy_adoption_pets.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';
import 'package:pet_pals/widgets/pet_adoption_item.dart';
import 'package:pet_pals/widgets/pets_bar_widget.dart';

class AdoptionFeedPage extends StatefulWidget {
  const AdoptionFeedPage({super.key});

  @override
  State<AdoptionFeedPage> createState() => _AdoptionFeedPageState();
}

class _AdoptionFeedPageState extends State<AdoptionFeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    final colors = [
      theme.primaryContainer,
      Color(0xFFDFD2C8),
      theme.secondaryContainer,
      theme.tertiaryContainer
    ];
    return Scaffold(
      key: _scaffoldKey,
      drawer: Menu(),
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Location
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(Icons.location_pin,
                          size: 40, color: Color.fromARGB(255, 245, 190, 138)),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )
                    ],
                  )
                ],
              ),
            ),
            Card(
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(children: [
                  const ListTile(
                    title: Text(
                      "Let's start the adoption!",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Text('Find your lovely pet'),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search pet',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: PetsBarWidget(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: dummyAdoptionPets.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return PetAdoptionItem(
                          pet: dummyAdoptionPets[index],
                          color: colors[index % colors.length]);
                    },
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
