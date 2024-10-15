import 'package:flutter/material.dart';
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  BottomNavBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap, // Pass the index to the parent to handle the change
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: 'Play',
            ),
            BottomNavigationBarItem(
              icon: SizedBox.shrink(), // Leave space for FloatingActionButton
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Learn',
            ),
          ],
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
