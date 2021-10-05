import 'package:flutter/material.dart';
import 'package:lyrics_app/createLyrics.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lyrics App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Create(),
    );
  }
}
