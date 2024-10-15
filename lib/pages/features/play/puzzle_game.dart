import 'package:flutter/material.dart';

class PuzzleGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Puzzle Game'),
      ),
      body: Center(
        child: Text(
          'Puzzle Game Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
