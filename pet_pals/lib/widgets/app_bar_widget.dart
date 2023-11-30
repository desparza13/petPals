// app_bar_widget.dart
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pals/pages/profile_page.dart';
import 'package:pet_pals/providers/data_provider_pet.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarWidget({required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var userImage = FirebaseAuth.instance.currentUser!.photoURL;

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openEndDrawer();
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70),
            child: userImage == null
                ? Container(
                  width: 50,
                  height: 50,
                  child: FutureBuilder<Uint8List>(
                      future: getFirebaseImage('no-profile-picture.png'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
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
                : Image.network(
                    userImage,
                    width: 50,
                    height: 50,
                  ),
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
