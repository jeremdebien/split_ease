// my_navbar.dart
import 'package:flutter/material.dart';
import 'package:split_ease/pages/collection/collection_page.dart';
import 'package:split_ease/pages/persons/persons_page.dart';

class MobileNavBar extends StatelessWidget {
  final int currentIndex;

  const MobileNavBar({
    super.key,
    required this.currentIndex,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return; // Avoid unnecessary navigation

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CollectionsPage(),
            ));
        break;
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PersonsPage(),
            ));
        break;
      case 2:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CollectionsPage(),
            ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Person',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
