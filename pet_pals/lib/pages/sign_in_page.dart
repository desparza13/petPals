import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart'; // new
import 'package:flutter/material.dart';
import 'package:pet_pals/pages/profile_page.dart';
import 'package:pet_pals/providers/user_provider.dart';
import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';
import 'package:pet_pals/widgets/terms_of_use_widget.dart';
import 'package:provider/provider.dart';
// import 'home.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    String uid = '';

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            showPasswordVisibilityToggle: true,
            providers: [
              EmailAuthProvider(),
              GoogleProvider(
                  clientId:
                      "1069943460237-4ln6ct15ipljstraarn46ratd8edeqqs.apps.googleusercontent.com"), // new
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Image.asset('assets/images/sign_in.png');
            },
            subtitleBuilder: (context, action) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Let's start the fun",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: theme.secondary,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Image.asset(
                      //   'assets/images/paw_icon.png',
                      //   width: 70,
                      //   height: 70,
                      // ),
                    ],
                  ),
                  action == AuthAction.signIn
                      ? const Text('Welcome to PetPals, please sign in!')
                      : const Text('Welcome to PetPals, please sign up!'),
                ],
              );
            },
            footerBuilder: (context, action) {
              return TermsOfUseWidget();
            },
            sideBuilder: (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/sign_in.png'),
                ),
              );
            },
          );
        }
        return BottomNavBar();
      },
    );
  }
}
// import 'package:flutter/material.dart';
// import 'register_page.dart';
// import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';

// class SignInPage extends StatefulWidget {
//   const SignInPage({super.key});

//   @override
//   _SignInPageState createState() => _SignInPageState();
// }

// class _SignInPageState extends State<SignInPage> {
//   bool _isPasswordHidden = true;

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context).colorScheme;
//     var isLandscape =
//         MediaQuery.of(context).orientation == Orientation.landscape;

//     Widget logo = Padding(
//       padding: EdgeInsets.only(top: isLandscape ? 0 : 50),
//       child: Image.asset(
//         'assets/images/sign_in.png',
//         width: isLandscape ? 250 : null,
//         fit: BoxFit.contain,
//       ),
//     );

//     //Style the inputs with color borders and circular edges as well as displaying the hint
//     InputDecoration getInputDecoration({required String hint}) {
//       return InputDecoration(
//         contentPadding:
//             const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//         filled: true,
//         hintText: hint,
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(25),
//           borderSide: const BorderSide(color: Color(0xFFEE8454)),
//         ),
//         focusedBorder: OutlineInputBorder(
//           // When focused
//           borderRadius: BorderRadius.circular(25),
//           borderSide:  BorderSide(color: theme.secondary),
//         ),
//         //Show or hide password
//         suffixIcon: hint == 'Password'
//             ? IconButton(
//                 icon: Icon(
//                   _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     _isPasswordHidden = !_isPasswordHidden;
//                   });
//                 },
//               )
//             : null,
//       );
//     }

//     //Page content
//     //This will be displayed below the logo on portrait and at its right in landscape
//     Widget content = Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (!isLandscape) logo,
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Let's start the fun",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold,
//                 color: theme.secondary,
//               ),
//             ),
//             const SizedBox(width: 10),
//             Image.asset(
//               'assets/images/paw_icon.png',
//               width: 70,
//               height: 70,
//             ),
//           ],
//         ),
//         const Padding(
//           padding: EdgeInsets.only(left: 28.0),
//           child: Text(
//             'Sign in to continue',
//             style: TextStyle(
//               fontSize: 16,
//             ),
//           ),
//         ),
//         const SizedBox(height: 25),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 28.0),
//           child: TextFormField(
//             decoration: getInputDecoration(hint: 'E-mail'),
//           ),
//         ),
//         const SizedBox(height: 15),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 28.0),
//           child: TextFormField(
//             obscureText: _isPasswordHidden,
//             decoration: getInputDecoration(hint: 'Password'),
//           ),
//         ),
//         const SizedBox(height: 30),
//         Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => BottomNavBar()),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: theme.secondary,
//                 foregroundColor: theme.onSecondary,
//                 // shape: RoundedRectangleBorder(
//                 //   borderRadius: BorderRadius.circular(30.0),
//                 // ),
//                 minimumSize: const Size(220, 50)),
//             child: const Text('Sign in', style: TextStyle(fontSize: 20)),
//           ),
//         ),
//         const SizedBox(height: 15),
//         Center(
//           child: ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => BottomNavBar()),
//               );
//             },
//             icon: Image.asset(
//               'assets/images/google_logo.png',
//               height: 20.0,
//             ),
//             label: const Text("Sign in with Google"),
//             style: ButtonStyle(
//               minimumSize: MaterialStateProperty.all(const Size(220, 50)),
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Don't have an account?",
//               style: TextStyle(color: Colors.grey),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => RegisterPage()),
//                 );
//               },
//               child: Text(
//                 'Sign up',
//                 style: TextStyle(color: theme.secondary),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.surface,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: SingleChildScrollView(
//           child: isLandscape
//               ? Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [logo, Expanded(child: content)],
//                 )
//               : content,
//         ),
//       ),
//     );
//   }
// }
