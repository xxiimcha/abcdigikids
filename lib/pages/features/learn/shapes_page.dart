import 'package:flutter/material.dart';

class ShapesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shapes'),
      ),
      body: Center(
        child: Text(
          'This is the Shapes page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
