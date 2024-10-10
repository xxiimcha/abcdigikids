import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/utils/routes.dart'; // Import routes

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ABCDigiKidsApp());
}

class ABCDigiKidsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABCDigiKids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.login, // Set initial route to LoginPage
      routes: AppRoutes.routes, // Use the routes from routes.dart
    );
  }
}
