import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'signup_page.dart';
import 'profile_selection_page.dart'; // Import the profile selection page

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Default credentials for login
  final String defaultEmail = "testuser@example.com";
  final String defaultPassword = "password123";

  void _login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email == defaultEmail && password == defaultPassword) {
      // If the credentials match, navigate to the profile selection page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileSelectionPage()),
      );
    } else {
      // If the credentials don't match, show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Invalid email or password"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
          // Login form
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Login',
                      onPressed: _login, // Handle login logic here
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text('Don’t have an account? Sign up'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
