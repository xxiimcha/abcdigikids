import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signUp() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _showError('Please fill in all fields');
      return;
    }

    if (password != confirmPassword) {
      _showError('Passwords do not match');
      return;
    }

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // User successfully signed up
      _showSuccess('Successfully signed up! You can now log in.');
      Navigator.pop(context); // Navigate back to login page
    } catch (e) {
      _showError(e.toString());
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  void _showSuccess(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // GIF background
          Image(
            image: AssetImage('assets/backgrounds/background.gif'), // Make sure the path to your GIF is correct
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Semi-transparent overlay to improve text readability
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Signup form
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
                    SizedBox(height: 10),
                    CustomTextField(
                      hintText: 'Confirm Password',
                      obscureText: true,
                      controller: confirmPasswordController,
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: 'Sign Up',
                      onPressed: _signUp, // Call the _signUp method on button press
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
