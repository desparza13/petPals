import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pals/pages/profile_page.dart';
import 'package:pet_pals/providers/dark_mode_provider.dart';
import 'package:pet_pals/theme/app_themes.dart';
import 'package:pet_pals/theme/bloc/theme_bloc.dart';
import 'package:provider/provider.dart';

class Menu extends StatefulWidget {

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final String username = "Jennifer";
  
  @override
  Widget build(BuildContext context) {
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
            Container(color: Color(0xFF8F4152).withOpacity(0.7)),
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
                          CircleAvatar(
                            //Make it circular
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'),
                            radius: 20.0,
                          ),
                          SizedBox(width: 15),
                          Text(username,
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

                        BlocProvider.of<ThemeBloc>(context)
                            .add(ThemeChangedEvent(theme: darkMode == true ? AppTheme.themeDark : AppTheme.themeLight ));
                      },
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: const Text('Log out',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onTap: () {
                      // Implementa la lógica de cerrar sesión aquí
                    },
                  ),
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
