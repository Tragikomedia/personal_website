import 'package:flutter/material.dart';
import 'package:web_test/components/reusable/language_change_button.dart';

class MobileLayout extends StatelessWidget {
  final Widget content;

  MobileLayout({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.white, child: Stack(children: [Align(
      alignment: Alignment.topRight,
      child: LanguageChangeButton(),
    ),content]),);
  }
}


