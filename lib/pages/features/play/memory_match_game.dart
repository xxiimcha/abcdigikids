import 'package:flutter/material.dart';

class MemoryMatchGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memory Match Game'),
      ),
      body: Center(
        child: Text(
          'Memory Match Game Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
