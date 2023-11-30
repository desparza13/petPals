import 'package:flutter/material.dart';
import 'package:pet_pals/widgets/app_bar_widget.dart';
import 'package:pet_pals/widgets/pets_bar_widget.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';
import 'package:pet_pals/widgets/pet_adoption_item.dart';
import 'package:pet_pals/models/pet.dart';

class AdoptionFeedPage extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<AdoptionFeedPage> createState() => _AdoptionFeedPageState();
}

class _AdoptionFeedPageState extends State<AdoptionFeedPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Pet> pets = [];

  @override
  void initState() {
    super.initState();
    _loadPets('All');
  }

  void _loadPets(String type) async {
    List<Pet> fetchedPets = await fetchPetsByType(type);
    setState(() {
      pets = fetchedPets;
    });
  }

  Color _getItemColor(int index) {
    var theme = Theme.of(context).colorScheme;
    List<Color> colors = [
      theme.primaryContainer,
      Color(0xFFDFD2C8),
      theme.secondaryContainer,
      theme.tertiaryContainer
    ];

    // Return a color based on the item's index
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBarWidget(scaffoldKey: _scaffoldKey),
      body: Column(
        children: [
          const ListTile(
            title: Text(
              "Let's start the adoption!",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            subtitle: Text('Find your lovely pet'),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: PetsBarWidget(
              onSelected: _loadPets,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: pets.length,
              itemBuilder: (context, index) {
                return PetAdoptionItem(
                  pet: pets[index],
                  color: _getItemColor(index), // Assign a color based on index
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
