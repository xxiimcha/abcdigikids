import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'learn/alphabets.dart';

class LearnScreen extends StatelessWidget {
  final Map<String, dynamic> profile;

  LearnScreen({required this.profile});

  void _loadAlphabetImages(BuildContext context) {
    List<String> imagePaths = [];
    for (var i = 0; i < 26; i++) {
      imagePaths.add('assets/learn_abc/${String.fromCharCode(65 + i)}.png');
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AlphabetsScreen(imagePaths: imagePaths),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        title: Text(
          'Learn',
          style: GoogleFonts.chewy(), // Apply Chewy font
        ),
        backgroundColor: Colors.redAccent, // Match the background color
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(profile['avatar']),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _loadAlphabetImages(context),
              child: Text('Alphabets'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Set button color
                textStyle: GoogleFonts.chewy(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Colors functionality
              },
              child: Text('Colors'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Set button color
                textStyle: GoogleFonts.chewy(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Numbers functionality
              },
              child: Text('Numbers'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Set button color
                textStyle: GoogleFonts.chewy(fontSize: 18),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement Shapes functionality
              },
              child: Text('Shapes'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Set button color
                textStyle: GoogleFonts.chewy(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
