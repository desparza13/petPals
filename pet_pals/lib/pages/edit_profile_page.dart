import 'package:flutter/material.dart';
import 'package:pet_pals/models/user.dart';
import 'package:pet_pals/providers/data_provider_users.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final usersDataProvider = UsersDataProvider();

  late TextEditingController _nameController;
  late TextEditingController _lastnameController;
  late TextEditingController _numberController;
  late TextEditingController _emailController;
  late TextEditingController _cityController;

  User? _user;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
    _nameController = TextEditingController();
    _lastnameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    _cityController = TextEditingController();
  }

  _fetchUserData() async {
    try {
      User userData = await usersDataProvider.getUserById("t5unAPjpCvZbg6nJl52Y");
      setState(() {
        _user = userData;
        _nameController.text = userData.name;
        _lastnameController.text = userData.lastname;
        _numberController.text = userData.number;
        _emailController.text = userData.email;
        _cityController.text = userData.city;
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: Text('Edit profile'),
          elevation: 2,
        ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (_user != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundImage: NetworkImage(_user!.image),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastnameController,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _numberController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                        labelText: 'City',
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (_user != null) {
                          User updatedUser = User(
                            id: _user!.id,
                            name: _nameController.text,
                            lastname: _lastnameController.text,
                            number: _numberController.text,
                            email: _emailController.text,
                            city: _cityController.text,
                            image: _user!.image,
                          );
                          await usersDataProvider.updateUser(updatedUser);
                          
                          // Mostrar SnackBar con mensaje
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Profile updated"),
                            ),
                          );
                          
                          // Redirigir a la página anterior
                          Navigator.pop(context);
                        }
                      },
                      child: Text("Save Changes"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    super.dispose();
  }
}
