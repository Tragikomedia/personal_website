import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  
  ButtonText({@required this.text, this.color=Colors.black, this.size=20.0});
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'AutourOne',
        fontSize: size
      ),
    );
  }
}
