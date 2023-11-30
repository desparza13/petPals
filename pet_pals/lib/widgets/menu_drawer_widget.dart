import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pals/pages/profile_page.dart';
import 'package:pet_pals/pages/sign_in_page.dart';
import 'package:pet_pals/providers/dark_mode_provider.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';
import 'package:pet_pals/theme/app_themes.dart';
import 'package:pet_pals/theme/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final String username =
      FirebaseAuth.instance.currentUser!.displayName.toString();

  @override
  Widget build(BuildContext context) {
    var userImage = FirebaseAuth.instance.currentUser!.photoURL;

    var theme = Theme.of(context).colorScheme;
    // Determine if the device is in landscape or portrait
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    DarkModeProvider darkModeProvider = Provider.of<DarkModeProvider>(context);
    bool darkMode = darkModeProvider.darkMode;

    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          // Choose the background image based on the orientation
          image: DecorationImage(
            image: AssetImage(isPortrait
                ? 'assets/images/menu_portrait.png'
                : 'assets/images/menu_landscape.png'),
            fit: BoxFit.cover,
            alignment: Alignment.topRight,
          ),
        ),
        child: Stack(
          children: [
            // Color overlay for the background but that allows the dog to be seen
            Container(color: theme.primary.withOpacity(0.7)),
            // Drawer content
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        //User avatar and name
                        GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()));
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(70),
                            child: userImage == null
                                ? Container(
                                    width: 50,
                                    height: 50,
                                    child: FutureBuilder<Uint8List>(
                                        future: getFirebaseImage(
                                            'no-profile-picture.png'),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Image.asset(
                                              "assets/images/no-profile-picture.png",
                                              fit: BoxFit.cover,
                                            );
                                          } else {
                                            print(snapshot.data!);
                                            return Image.memory(
                                              snapshot.data!,
                                            );
                                          }
                                        }),
                                  )
                                : Image.network(
                                    userImage,
                                    width: 50,
                                    height: 50,
                                  ),
                          ),
                          SizedBox(width: 15),
                          Text(username == null ? '' : username,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        _buildMenuItem(Icons.pets, 'Home', context, '/home'),
                        _buildMenuItem(Icons.add_circle_outline, 'Add pet',
                            context, '/addPet'),
                        _buildMenuItem(
                            Icons.question_answer, 'Q&A', context, '/qa'),
                        _buildMenuItem(Icons.workspace_premium_rounded, 'Store',
                            context, '/buyPage'),
                        Divider(color: Colors.white),
                      ],
                    ),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.brightness_6, color: Colors.white),
                    title: const Text('Dark Mode',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    trailing: Switch(
                      activeColor: Colors.white,
                      value: darkMode,
                      onChanged: (bool value) {
                        // Change the colors to darkmode
                        setState(() {
                          darkModeProvider.toggleDarkMode();
                          darkMode = darkModeProvider.darkMode;
                        });

                        BlocProvider.of<ThemeBloc>(context).add(
                            ThemeChangedEvent(
                                theme: darkMode == true
                                    ? AppTheme.themeDark
                                    : AppTheme.themeLight));
                      },
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignInPage()));
                      },
                      child: const SignOutButton()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Function to avoid repeating the code for creating list items
  ListTile _buildMenuItem(
      IconData icon, String title, BuildContext context, String route) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
      onTap: () {
        Navigator.pushNamed(context, route); // Navega a la ruta especificada
      },
    );
  }
}
