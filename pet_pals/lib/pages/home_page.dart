import 'package:flutter/material.dart';
import '../widgets/menu_drawer_widget.dart';
import '../widgets/pet_home_item.dart';
import '../dummy_data/dummy_pets.dart';
import 'profile_page.dart';
import '../widgets/bottom_nav_bar_widget.dart';
import '../widgets/to_do_home_widget.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final colors = [
    Color(0xFFFFDE59),
    Color(0xFFDFD2C8),
    Color(0xFFC0F6FF),
    Color(0xFFBBFFAD)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF8F4152),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            if (_scaffoldKey.currentState!.isDrawerOpen) {
              _scaffoldKey.currentState!.openEndDrawer();
            } else {
              _scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        title: Text('Home', style: TextStyle(color: Colors.white)),
        actions: [
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'),
              radius: 25.0,
            ),
          ),
          const SizedBox(width: 25),
        ],
      ),
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
                  Container(
                    height: 200,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: dummyPets.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      itemBuilder: (context, index) {
                        return PetHomeItem(
                          pet: dummyPets[index],
                          color: colors[index % colors.length],
                        );
                      },
                    ),
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
