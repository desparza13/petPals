import 'package:flutter/material.dart';
import 'package:pet_pals/pages/adoption_feed_page.dart';
import 'package:pet_pals/pages/home_page.dart';
import 'package:pet_pals/pages/q&a_page.dart';
import 'package:pet_pals/pages/to_do_page.dart';
import 'package:pet_pals/pages/new_task_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
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
    final List<Widget> _pages = [
      HomePage(),
      NewTaskPage(),
      ToDoPage(),
      const AdoptionFeedPage(),
      QAPage(),
    ];
    var theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: _selectedIndex == 0 ? theme.primary : Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add,
                color: _selectedIndex == 1 ? theme.primary : Colors.grey),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list,
                color: _selectedIndex == 2 ? theme.primary : Colors.grey),
            label: 'To-Do',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,
                color: _selectedIndex == 3 ? theme.primary : Colors.grey),
            label: 'Adoptions',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: theme.primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(color: theme.primary),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }
}
