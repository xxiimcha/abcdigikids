import 'package:flutter/material.dart';

class QuizGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Game'),
      ),
      body: Center(
        child: Text(
          'Quiz Game Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
