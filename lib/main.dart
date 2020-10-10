import 'package:flutter/material.dart';
import 'package:web_test/layouts/background_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Webpage',
      home: BackgroundLayout(),
    );
  }
}

