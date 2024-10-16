import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_selection_page.dart'; // Import ProfileSelectionPage

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _pinRequired = false;

  void _createProfile() async {
    String name = nameController.text.trim();
    String birthday = birthdayController.text.trim();
    String pin = pinController.text.trim();
    User? user = _auth.currentUser;

    if (name.isEmpty || birthday.isEmpty || (pin.isEmpty && _pinRequired)) {
      _showError('Please fill in all required fields');
      return;
    }

    if (user == null) {
      _showError('User not logged in. Please log in and try again.');
      return;
    }

    try {
      // Add profile to Firestore
      await _firestore.collection('app_profiles').add({
        'userId': user.uid,
        'name': name,
        'birthday': birthday,
        'pin': _pinRequired ? pin : null,
        'createdAt': Timestamp.now(),
      });

      _showSuccess('Profile created successfully!');

      // Navigate back to ProfileSelectionPage and reload profiles
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProfileSelectionPage()),
      );
    } catch (e) {
      print('Error creating profile: $e');
      _showError('Error creating profile. Please try again.');
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
      appBar: AppBar(
        title: Text('Create Profile'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Your Profile',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Profile Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: birthdayController,
                decoration: InputDecoration(
                  labelText: 'Birthday (MM/DD/YYYY)',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.calendar_today),
                ),
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text('Require PIN for this profile'),
                value: _pinRequired,
                onChanged: (bool? value) {
                  setState(() {
                    _pinRequired = value ?? false;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              if (_pinRequired) // Show the PIN field only if PIN is required
                Column(
                  children: [
                    SizedBox(height: 10),
                    TextFormField(
                      controller: pinController,
                      decoration: InputDecoration(
                        labelText: 'PIN',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: _createProfile,
                  child: Text(
                    'Create Profile',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
