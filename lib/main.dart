import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/layouts/background_layout.dart';
import 'package:web_test/notifiers/current_page_notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Webpage',
      home: ChangeNotifierProvider(
          create: (context) => CurrentPageNotifier(),
          child: BackgroundLayout()),
    );
  }
}
