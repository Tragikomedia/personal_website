import 'package:flutter/material.dart';

class FormattedText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  
  FormattedText({@required this.text, this.color=Colors.black, this.size=20.0});
  
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(
        color: color,
        fontFamily: 'AutourOne',
        fontSize: size
      ),
    );
  }
}
