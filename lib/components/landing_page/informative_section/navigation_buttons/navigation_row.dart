import 'package:flutter/material.dart';

class NavigationRow extends StatelessWidget {
  final List<Widget> buttons;

  NavigationRow({@required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buttons,
    );
  }
}
