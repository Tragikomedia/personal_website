import 'package:flutter/material.dart';
import 'package:web_test/components/drawer/drawer_button.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            DrawerButton(text: 'Main'),
            DrawerButton(text: 'About Me'),
            DrawerButton(text: 'Translations'),
            DrawerButton(text: 'Programming'),
            DrawerButton(text: 'Contact')
          ],
        ),
      ),
    );
  }
}
