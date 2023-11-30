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
        SizedBox(height: 100,)
      ],
    );
  }
}
