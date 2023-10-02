import 'package:flutter/material.dart';
import 'package:pet_pals/pages/buy_page.dart';
import 'package:pet_pals/pages/home_page.dart';
import 'package:pet_pals/pages/q&a_page.dart';
import 'package:pet_pals/pages/to_do_page.dart';
import 'pages/welcome_page.dart';
import 'widgets/menu_drawer_widget.dart';

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
        '/buyPage': (context) => const BuyPage(),
        '/qa': (context) => QAPage(),
      },
    );
  }
}
