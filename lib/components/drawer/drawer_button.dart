import 'package:flutter/material.dart';
import 'package:web_test/components/reusable/button_text.dart';

class DrawerButton extends StatelessWidget {
  final String text;

  DrawerButton({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListTile(
        title: ButtonText(
          text: text,
          color: Colors.white,
          size: 15,
        )
      ),
    );
  }
}
