import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pals/pages/edit_profile_page.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';
import 'package:pet_pals/widgets/menu_drawer_widget.dart';
import 'package:pet_pals/models/user.dart';
import 'package:pet_pals/providers/data_provider_users.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final usersDataProvider = UsersDataProvider();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var userImage = FirebaseAuth.instance.currentUser!.photoURL;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: false,
        elevation: 2,
      ),
      drawer: Menu(),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (FirebaseAuth.instance.currentUser != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: userImage == null
                        ? Container(
                          width: 150,
                          height: 150,
                          child: FutureBuilder<Uint8List>(
                              future: getFirebaseImage('no-profile-picture.png'),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Image.asset(
                                    "assets/images/no-profile-picture.png",
                                    fit: BoxFit.cover,
                                  );
                                } else {
                                  print(snapshot.data!);
                                  return Image.memory(
                                    snapshot.data!,
                                  );
                                }
                              }),
                        )
                        : Image.network(userImage),
                  ),
                ),
              Container(
                width: 396,
                constraints: const BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildTile('Mi Perfil', 'Actualizar datos de mi perfil',
                        EditProfile()),
                    _buildTile('Entrenamientos',
                        'Ver mis entrenamientos adquiridos', EditProfile()),
                    _buildTile('Planes Alimenticios',
                        'Ver mis planes adquiridos', EditProfile()),
                    _buildTile('Mi Contraseña', 'Actualizar contraseña',
                        EditProfile()),
                    _buildTile(
                        'Mis Formas de Pago',
                        'Ver, editar y agregar mis fomas de pago',
                        EditProfile()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTile(String title, String subtitle, Widget page) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(36, 15, 35, 15),
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
        },
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Color(0xFF0A0909),
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              color: Color(0xFF0A0909),
              fontSize: 12,
            ),
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right_sharp,
            color: Color(0xFFFFD8B1),
            size: 20,
          ),
          tileColor: const Color(0xFFFFD8B1),
          dense: false,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
