import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'signup_page.dart';
import 'profile_selection_page.dart';
import 'create_profile_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  bool _isLoading = false;

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showError('Please fill in both email and password');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      print('Attempting to log in with email: $email');
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('User logged in with UID: ${userCredential.user?.uid}');
      _checkForProfiles(userCredential.user?.uid);
    } catch (e) {
      print('Error during login: $e');
      _showError('Invalid email or password');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _checkForProfiles(String? userId) async {
    if (userId == null) {
      _showError('User ID is null. Please try again.');
      return;
    }

    try {
      print('Checking for profiles for user ID: $userId');
      QuerySnapshot profileSnapshot = await _firestore
          .collection('app_profiles')
          .where('userId', isEqualTo: userId)
          .get();

      if (profileSnapshot.docs.isNotEmpty) {
        print('Profiles found for user ID: $userId');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfileSelectionPage()),
        );
      } else {
        print('No profiles found for user ID: $userId');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CreateProfilePage()),
        );
      }
    } catch (e) {
      print('Error checking for profiles: $e');
      _showError('Error checking profiles. Please try again.');
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
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      hintText: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      hintText: 'Password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    SizedBox(height: 30),
                    _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : CustomButton(
                            text: 'Login',
                            onPressed: _login,
                          ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      child: Text(
                        'Don’t have an account? Sign up',
                        style: TextStyle(color: Colors.white),
                      ),
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
