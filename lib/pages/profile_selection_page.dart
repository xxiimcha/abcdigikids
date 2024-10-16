import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart'; // Import HomeScreen
import 'create_profile_page.dart'; // Import HomeScreen

class ProfileSelectionPage extends StatefulWidget {
  @override
  _ProfileSelectionPageState createState() => _ProfileSelectionPageState();
}

class _ProfileSelectionPageState extends State<ProfileSelectionPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> profiles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProfiles();
  }

  Future<void> _fetchProfiles() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      QuerySnapshot snapshot = await _firestore
          .collection('app_profiles')
          .where('userId', isEqualTo: user.uid)
          .get();

      setState(() {
        profiles = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching profiles: $e');
      setState(() {
        isLoading = false;
      });
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
          // Profile selection
          Center(
            child: isLoading
                ? CircularProgressIndicator(color: Colors.white)
                : Column(
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
                      profiles.isEmpty
                          ? Text(
                              'No profile created',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            )
                          : Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 20,
                              runSpacing: 20,
                              children: profiles.map((profile) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(profileName: profile['name']),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white, width: 2),
                                          image: DecorationImage(
                                            image: AssetImage('assets/profile_placeholder.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        profile['name'],
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
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateProfilePage(),
                            ),
                          );
                        },
                        child: Text(
                          profiles.isEmpty ? 'Create Profile' : 'Add Profile',
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
