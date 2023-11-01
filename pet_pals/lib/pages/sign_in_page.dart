import 'package:flutter/material.dart';
import 'register_page.dart';
import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    Widget logo = Padding(
      padding: EdgeInsets.only(top: isLandscape ? 0 : 50),
      child: Image.asset(
        'assets/images/sign_in.png',
        width: isLandscape ? 250 : null,
        fit: BoxFit.contain,
      ),
    );

    //Style the inputs with color borders and circular edges as well as displaying the hint
    InputDecoration getInputDecoration({required String hint}) {
      return InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Color(0xFFEE8454)),
        ),
        focusedBorder: OutlineInputBorder(
          // When focused
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Color(0xFF5E17EB)),
        ),
        //Show or hide password
        suffixIcon: hint == 'Password'
            ? IconButton(
                icon: Icon(
                  _isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordHidden = !_isPasswordHidden;
                  });
                },
              )
            : null,
      );
    }

    //Page content
    //This will be displayed below the logo on portrait and at its right in landscape
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isLandscape) logo,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Let's start the fun",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E17EB),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset(
              'assets/images/paw_icon.png',
              width: 70,
              height: 70,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(
            'Sign in to continue',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: TextFormField(
            decoration: getInputDecoration(hint: 'E-mail'),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: TextFormField(
            obscureText: _isPasswordHidden,
            decoration: getInputDecoration(hint: 'Password'),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar()),
              );
            },
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(220, 50)),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF5E17EB)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            child: const Text('Sign in', style: TextStyle(fontSize: 20)),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar()),
              );
            },
            icon: Image.asset(
              'assets/images/google_logo.png',
              height: 20.0,
            ),
            label: const Text("Sign in with Google"),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(220, 50)),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(color: Colors.grey),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text(
                'Sign up',
                style: TextStyle(color: Color(0xFF5E17EB)),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: const Color(0xFFEBDFE3),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: isLandscape
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [logo, Expanded(child: content)],
                )
              : content,
        ),
      ),
    );
  }
}
