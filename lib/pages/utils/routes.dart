import 'package:flutter/material.dart';
import '../login_page.dart'; // Adjust the path based on your file structure
import '../home_screen.dart'; // Import HomeScreen (if needed)
import '../features/speak/talk_screen.dart'; // Import TalkScreen
import '../features/learn/learn_screen.dart'; // Import LearnScreen

class AppRoutes {
  static const String login = '/login'; // Route for the login screen
  static const String talk = '/talk';   // Route for the talk screen
  static const String learn = '/learn'; // Route for LearnScreen
  static const String home = '/home';   // Route for the home screen (if needed)

  static Map<String, WidgetBuilder> routes = {
    login: (context) => LoginPage(), // Define the login route
    home: (context) => HomeScreen(profileName: 'User'), // Define the home screen route
    talk: (context) => TalkScreen(), // Define the talk screen route
    learn: (context) => LearnScreen(), // Add LearnScreen route
  };
}
