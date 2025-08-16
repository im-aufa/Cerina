// lib/widgets/navbar.dart
import 'package:cerina/features/calendar/calendar_screen.dart';
import 'package:cerina/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:cerina/features/homepage/homepage_screen.dart'; // Adjust path
// Add imports for other screens as you create them
// e.g., import 'package:cerina/features/calendar/calendar_screen.dart';
//       import 'package:cerina/features/settings/settings_screen.dart';
//       import 'package:cerina/features/account/account_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0; // Default to Home (index 0)

  // List of screens corresponding to navbar destinations
  static final List<Widget> _screens = [
    const HomepageScreen(), // Your existing HomepageScreen
    const CalendarScreen(), // Placeholder
    const Center(child: Text('Settings Screen')), // Placeholder
    const ProfileScreen(), // Placeholder
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index; // Update selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 20, // Shadow depth
        shadowColor: Colors.black.withOpacity(0.2), // Custom shadow color
        child: NavigationBar(
          backgroundColor: Colors.white,
          height: 80,
          selectedIndex: _selectedIndex,
          onDestinationSelected: _onDestinationSelected,
          indicatorColor: Colors.transparent, // Remove indication shape
          destinations: [
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/05.png',
                width: 24,
                height: 24,
                color: Colors.black, // Unselected: black
              ),
              selectedIcon: Image.asset(
                'assets/icons/05.png',
                width: 24,
                height: 24,
                color: Colors.pink[400], // Selected: pink
              ),
              label: '', // Empty label to remove it
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/06.png',
                width: 24,
                height: 24,
                color: Colors.black, // Unselected: black
              ),
              selectedIcon: Image.asset(
                'assets/icons/06.png',
                width: 24,
                height: 24,
                color: Colors.pink[400], // Selected: pink
              ),
              label: '', // Empty label to remove it
            ),
            NavigationDestination(
              icon: Image.asset(
                'assets/icons/07.png',
                width: 24,
                height: 24,
                color: Colors.black, // Unselected: black
              ),
              selectedIcon: Image.asset(
                'assets/icons/07.png',
                width: 24,
                height: 24,
                color: Colors.pink[400], // Selected: pink
              ),
              label: '', // Empty label to remove it
            ),
            const NavigationDestination(
              icon: CircleAvatar(
                backgroundImage: AssetImage('assets/images/08.png'),
              ),

              label: '', // Empty label to remove it
            ),
          ],
        ),
      ),
      body: _screens[_selectedIndex], // Display the selected screen
    );
  }
}
