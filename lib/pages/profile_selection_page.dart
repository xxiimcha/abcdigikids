import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import HomeScreen

class ProfileSelectionPage extends StatelessWidget {
  final List<String> profiles = ['User 1', 'User 2', 'User 3', 'User 4']; // Sample profiles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // GIF background
          Image(
            image: AssetImage('assets/backgrounds/background.gif'),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Semi-transparent overlay
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          // Profile selection
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Who\'s Watching?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: profiles.map((profile) {
                    return GestureDetector(
                      onTap: () {
                        // Navigate to HomeScreen when a profile is selected
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(profileName: profile),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          // Profile icon (circular with some padding)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16),
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                              image: DecorationImage(
                                image: AssetImage('assets/profile_placeholder.jpg'), // Replace with actual profile image
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            profile,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),
                // Add button to add more profiles (optional)
                TextButton(
                  onPressed: () {
                    // Handle adding new profile
                  },
                  child: Text(
                    'Add Profile',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
