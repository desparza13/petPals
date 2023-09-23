import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: _selectedIndex == 0 ? Color(0xFF8F4152) : Colors.grey),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.pets, color: _selectedIndex == 1 ? Color(0xFF8F4152) : Colors.grey),
          label: 'My Pets',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, color: _selectedIndex == 2 ? Color(0xFF8F4152) : Colors.grey),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, color: _selectedIndex == 3 ? Color(0xFF8F4152) : Colors.grey),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: _selectedIndex == 4 ? Color(0xFF8F4152) : Colors.grey),
          label: 'Adoptions',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF8F4152),
      unselectedItemColor: Colors.grey,
      selectedLabelStyle: TextStyle(color: Color(0xFF8F4152)),
      unselectedLabelStyle: TextStyle(color: Colors.grey),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: _onItemTapped,
    );
  }
}
