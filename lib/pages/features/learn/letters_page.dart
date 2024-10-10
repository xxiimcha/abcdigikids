import 'package:flutter/material.dart';

class LettersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Letters'),
      ),
      body: Center(
        child: Text(
          'This is the Letters page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
