import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  // List of all image paths in the learn_colors folder
  final List<String> imagePaths = [
    'assets/learn_colors/red.png',
    'assets/learn_colors/blue.png',
    'assets/learn_colors/green.png',
    'assets/learn_colors/yellow.png',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Colors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imagePaths.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Adjust the number of columns here
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      imagePaths[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      imagePaths[index]
                          .split('/')
                          .last
                          .split('.')
                          .first
                          .toUpperCase(), // Displays the color name as the image name
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
