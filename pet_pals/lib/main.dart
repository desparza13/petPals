import 'package:flutter/material.dart';
import 'package:pet_pals/pages/home_page.dart';
import 'package:pet_pals/pages/to_do_page.dart';
import 'pages/welcome_page.dart';
import 'widgets/menu_drawer_widget.dart';
//Rutas
import 'package:pet_pals/pages/adoption_feed_page.dart';
import 'package:pet_pals/pages/add_pet_page.dart';
import 'package:pet_pals/pages/to_do_page.dart';
import 'package:pet_pals/pages/q&a_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: WelcomePage(),
      routes: {
        //'/adoption': (context) => AdoptionPage(), // Página de adopción
        //'/addPet': (context) => AddPetPage(), // Página para agregar mascota
        '/todo': (context) => ToDoPage(), // Página de To-do
        //'/qa': (context) => QAPage(), // Página de Q&A
      },

    );
  }
}
