import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  HeaderText({@required this.text, this.color=Colors.black, this.size=60.0});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: color, fontSize: size, fontFamily: 'AutourOne'),
    );
  }
}
