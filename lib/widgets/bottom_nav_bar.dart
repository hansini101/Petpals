import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFB89C5A), // Gold background color
        border: Border(
          top: BorderSide(
            color:
                Color.fromARGB(115, 235, 231, 231), // Light border for clarity
            width: 0.5,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor:
            Colors.transparent, // Allows the container’s color to show
        selectedItemColor: Colors.white, // White for selected item
        unselectedItemColor:
            Colors.white70, // Slightly faded white for unselected items
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // Ensures consistent styling
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services), label: "Medical"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Pets"),
        ],
      ),
    );
  }
}
