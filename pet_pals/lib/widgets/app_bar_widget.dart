// app_bar_widget.dart
import 'package:flutter/material.dart';
import 'package:pet_pals/pages/profile_page.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  AppBarWidget({required this.scaffoldKey});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF8F4152),
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.white),
        onPressed: () {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            scaffoldKey.currentState!.openEndDrawer();
          } else {
            scaffoldKey.currentState!.openDrawer();
          }
        },
      ),
      title: Text('Home', style: TextStyle(color: Colors.white)),
      actions: [
        GestureDetector(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfilePage()));
          },
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'),
            radius: 25.0,
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
