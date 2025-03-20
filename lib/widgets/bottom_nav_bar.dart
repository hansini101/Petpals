import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petpals/home.dart';
import 'package:petpals/pet_care.dart';
import 'package:petpals/pet_shop.dart';
import 'package:petpals/settings/settings_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTabChange;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabChange,
    required Null Function(dynamic index) onTap,
  });

  void _navigateTo(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var tween = Tween(
            begin: const Offset(0.5, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.ease));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  void _onTabChange(BuildContext context, int index) {
    switch (index) {
      case 0:
        _navigateTo(context, const HomePage());
        break;
      case 1:
        _navigateTo(context, const PetCarePage());
        break;
      case 2:
        _navigateTo(context, const PetShopPage());
        break;
      case 3:
        _navigateTo(context, const SettingsScreen());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black26,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
          selectedIndex: selectedIndex,
          tabBackgroundColor: const Color(0xFFB28A47), // Changed to brown
          padding: const EdgeInsets.all(12),
          tabBorderRadius: 10,
          gap: 8,
          onTabChange: (index) {
            _onTabChange(context, index); // Force navigation on every tap
            onTabChange(index);
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.pets, text: 'Pet Care'),
            GButton(icon: Icons.shopping_cart, text: 'Pet Shop'),
            GButton(icon: Icons.settings, text: 'Settings'),
          ],
        ),
      ),
    );
  }
}
