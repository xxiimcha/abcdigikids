import 'package:flutter/material.dart';
import 'utils/bottom_navbar.dart'; // Import BottomNavBar
import 'utils/routes.dart'; // Import routes
import '../pages/features/learn/learn_screen.dart'; // Import LearnScreen for direct rendering
import '../pages/features/play/play_screen.dart'; // Import LearnScreen for direct rendering

class HomeScreen extends StatefulWidget {
  final String profileName;

  HomeScreen({required this.profileName});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Define the screens for each tab index
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      PlayScreen(),
      Center(child: Text('Talk Screen')), // Placeholder for Talk content
      LearnScreen(), // Learn screen content
    ];
  }

  // Build a sample home screen with user information
  Widget _buildHomeScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100, color: Colors.blueAccent),
          SizedBox(height: 20),
          Text(
            'Welcome, ${widget.profileName}!',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'This is your home screen',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the current index for the selected tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Talk screen
          Navigator.pushNamed(context, AppRoutes.talk);
        },
        child: Icon(Icons.mic, size: 30, color: Colors.white),
        backgroundColor: Colors.teal,
        elevation: 5,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Get the title for the AppBar based on the selected index
  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Talk';
      case 2:
        return 'Learn';
      default:
        return 'App';
    }
  }
}
