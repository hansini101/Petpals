import 'package:flutter/material.dart';
import 'package:petpals/settings/settings_screen.dart';
import 'package:petpals/home.dart';
import 'package:petpals/pet_care.dart';
import 'package:petpals/pet_shop.dart';
// Ensure this import is correct

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onTabChange,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.pets), label: 'Pet Care'),
        BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Pet Shop'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTabChange(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = const HomePage();
    switch (_selectedIndex) {
      case 0:
        screen = const HomePage();
        break;
      case 1:
        screen = const PetCarePage();
        break;
      case 2:
        screen = const PetShopPage();
        break;
      case 3:
        screen = const SettingsScreen();
        break;
    }

    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onTabChange: _onTabChange,
      ),
    );
  }
}
