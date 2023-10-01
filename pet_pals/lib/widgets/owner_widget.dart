import 'package:flutter/material.dart';

class OwnerWidget extends StatelessWidget {
  const OwnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png'),
                  radius: 25.0,
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Daniela Esparza',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [Text('Owner')],
                )
              ],
            ),
            SizedBox(
              width: 100,
            ),
            Column(
              children: [
                Row(
                  children: [Text('1.6Km')],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextStyle(fontSize: 13),
                textAlign: TextAlign.justify,
              )),
            ],
          ),
        ),
      ],
    );
  }
}
