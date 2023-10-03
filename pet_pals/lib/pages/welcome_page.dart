import 'package:flutter/material.dart';
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
      backgroundColor: const Color(0xFFEBDFE3),
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
                  //Alignment depending on the orientation
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
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Animal Lovers',
                        style: TextStyle(
                          fontSize: getFontSize(35, 25),
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Community',
                        style: TextStyle(
                          fontSize: getFontSize(50, 35),
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Image.asset(
                    'assets/images/welcome.png',
                    //Change image size depending on orientation
                    width: isLandscape ? 250 : null,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      //Go to register
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF5E17EB)),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                    ),
                    child: const Text(
                      "Let's Go",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
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
                        //Go to sign in
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: getFontSize(20, 16),
                            color: Color(0xFF5E17EB)),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
