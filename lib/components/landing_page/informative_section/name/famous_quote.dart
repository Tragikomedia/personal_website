import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class FamousQuote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 450,
    height: 50.0,
    child: FadeAnimatedTextKit(
      repeatForever: true,
      alignment: Alignment.centerRight,
      duration: Duration(seconds: 10),
      textStyle: TextStyle(fontFamily: 'AutourOne', fontSize: 20.0, color: Colors.black45),
      text: ['"Nein, nein, nein"','Lorem Ipsum is simply dummy text of the printing and typesetting industry', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout']),);
  }
}
