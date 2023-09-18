import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'menu_drawer_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Menu(),
    );
  }
}