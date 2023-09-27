import 'package:flutter/material.dart';

import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: BottomNavBar(),
    );
  }
}
