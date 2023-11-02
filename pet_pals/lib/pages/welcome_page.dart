import 'package:flutter/material.dart';
import 'package:pet_pals/widgets/terms_of_use_widget.dart';
import 'register_page.dart';
import 'sign_in_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    //Function to choose the font size depending on the device's orientation
    double getFontSize(double portraitSize, double landscapeSize) {
      return isLandscape ? landscapeSize : portraitSize;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: isLandscape
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  alignment:
                      isLandscape ? Alignment.center : Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: isLandscape
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Join Our',
                        style: TextStyle(
                          fontSize: getFontSize(30, 20),
                        ),
                      ),
                      Text(
                        'Animal Lovers',
                        style: TextStyle(
                          fontSize: getFontSize(35, 25),
                        ),
                      ),
                      Text(
                        'Community',
                        style: TextStyle(
                          fontSize: getFontSize(40, 35),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    'assets/images/welcome.png',
                    width: isLandscape ? 250 : null,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor: Theme.of(context).colorScheme.onSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                    ),
                    child: const Text(
                      "Let's Go",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Espaciado adicional
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: getFontSize(20, 16),
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: getFontSize(20, 16),
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    )
                  ],
                ),
                TermsOfUseWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
