import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: Center(
        child: Text(
          'This is the Numbers page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
