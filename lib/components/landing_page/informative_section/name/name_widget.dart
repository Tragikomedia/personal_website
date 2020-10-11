import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:web_test/utilities/constants.dart';

class NameWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TyperAnimatedTextKit(
      text: ['Milan Żółw'],
      textStyle: TextStyle(fontFamily: 'AutourOne', fontSize: kDeskNameSize, color: Colors.black),
      isRepeatingAnimation: false,
      speed: Duration(milliseconds: 200),
      pause: Duration(seconds: 20),
    );
  }
}
