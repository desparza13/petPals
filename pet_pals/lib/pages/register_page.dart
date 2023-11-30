import 'package:flutter/material.dart';
import 'sign_in_page.dart';
import 'package:pet_pals/widgets/bottom_nav_bar_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordHidden = true;

  //Get the input decoration with the correct color borders and show and hide passwords
  InputDecoration getInputDecoration({required String hint}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      filled: true,
      hintText: hint,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Color(0xFFEE8454)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: Color(0xFF5E17EB)),
      ),
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

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var theme = Theme.of(context).colorScheme;
    // Logo widget
    Widget logo = Padding(
      padding: EdgeInsets.only(top: isLandscape ? 0 : 50),
      child: Image.asset(
        'assets/images/register.png',
        width: isLandscape ? 250 : null,
        fit: BoxFit.contain,
      ),
    );

    // Page content
    Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isLandscape) logo,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: theme.secondary),
            ),
            Image.asset(
              'assets/images/paw_icon.png',
              width: 70,
              height: 70,
            ),
          ],
        ),
        Text(
          'Sign up to continue',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(height: 20),
        TextFormField(
          decoration: getInputDecoration(hint: 'Name'),
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: getInputDecoration(hint: 'Last names'),
        ),
        SizedBox(height: 10),
        TextFormField(
          decoration: getInputDecoration(hint: 'E-mail'),
        ),
        SizedBox(height: 10),
        TextFormField(
          obscureText: _isPasswordHidden,
          decoration: getInputDecoration(hint: 'Password'),
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: theme.secondary,
                foregroundColor: theme.onSecondary,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(30.0),
                // ),
                minimumSize: const Size(220, 50)),
            child: const Text('Sign up', style: TextStyle(fontSize: 20)),
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => BottomNavBar()),
              );
            },
            icon: Image.asset(
              'assets/images/google_logo.png',
              height: 20.0,
            ),
            label: const Text("Continue with Google"),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(220, 50)),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                // Lógica del botón Log in
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPage()),
                );
              },
              child: Text(
                'Log in',
                style: TextStyle(color: theme.secondary),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
