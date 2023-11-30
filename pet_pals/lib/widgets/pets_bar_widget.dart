import 'package:flutter/material.dart';

class PetsBarWidget extends StatefulWidget {
  final Function(String) onSelected;

  const PetsBarWidget({super.key, required this.onSelected});

  @override
  State<PetsBarWidget> createState() => _PetsBarWidgetState();
}

class _PetsBarWidgetState extends State<PetsBarWidget> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Dog Button
        _buildPetTypeButton('Dog', 'assets/images/icons/dog_icon.png', 1),
        // Cat Button
        _buildPetTypeButton('Cat', 'assets/images/icons/cat_icon.png', 2),
        // Bird Button
        _buildPetTypeButton('Bird', 'assets/images/icons/bird_icon.png', 3),
        // All Button
        _buildPetTypeButton('All', 'assets/images/icons/all_icon.png', 4),
      ],
    );
  }

  Widget _buildPetTypeButton(String type, String iconPath, int index) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              selected = index;
            });
            widget.onSelected(type);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selected == index ? Theme.of(context).colorScheme.tertiary : Theme.of(context).colorScheme.background,
            fixedSize: const Size(80, 80),
          ),
          child: Image.asset(iconPath),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            type,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
