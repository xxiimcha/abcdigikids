import 'package:flutter/material.dart';
import 'utils/bottom_navbar.dart'; // Import BottomNavBar
import 'utils/routes.dart'; // Import routes
import '../pages/features/learn/learn_screen.dart'; // Import LearnScreen for direct rendering

class HomeScreen extends StatefulWidget {
  final String profileName;

  HomeScreen({required this.profileName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define the screens for each tab index
  final List<Widget> _pages = [
    Center(child: Text('Home Screen')), // Home screen content
    Center(child: Text('Talk Screen')), // Placeholder for Talk content
    LearnScreen(), // Learn screen content
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index for the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Change content based on selected index
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.talk); // Navigate to Talk screen
        },
        child: Icon(Icons.mic, size: 30, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
