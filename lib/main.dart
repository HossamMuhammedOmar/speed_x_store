import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Speed X'),
        ),
        body: Center(
          child: Text(
            'Welcome To Speed X Sotre 😀',
            style: TextStyle(
              fontSize: 27,
            ),
          ),
        ),
      ),
    );
  }
}
