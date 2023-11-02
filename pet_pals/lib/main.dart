import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_pals/providers/dark_mode_provider.dart';
import 'package:pet_pals/theme/bloc/theme_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
// Rutas
import 'package:pet_pals/pages/add_pet_page.dart';
import 'package:pet_pals/pages/q&a_page.dart';
import 'package:pet_pals/pages/to_do_page.dart';
import 'package:provider/provider.dart';
import 'pages/welcome_page.dart';
import 'package:pet_pals/pages/buy_page.dart';
import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Inicializa Firebase
  runApp(
    MultiProvider(
      providers: [
        //Bloc Provider para los temas de la aplicación
        BlocProvider( 
          create: (context) => ThemeBloc()
          ),
        // Provider para el estado global del modo oscuro
        ChangeNotifierProvider(
          create: (context) => DarkModeProvider()
          ),
      ], 
      child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state.themeData,
          home: WelcomePage(),
          routes: {
            '/buyPage': (context) => const BuyPage(),
            '/home': (context) => const BottomNavBar(), // Página de adopción
            '/addPet': (context) => const AddPetPage(), // Página para agregar mascota
            '/todo': (context) => const ToDoPage(), // Página de To-do
            '/qa': (context) => QAPage(), // Página de Q&A
            '/welcomePage': (context) => WelcomePage()
          },
        );
      },
    );
  }
}
