import 'package:flutter/material.dart';
import 'package:web_test/layouts/desktop_layout.dart';
import 'package:web_test/pages/landing_page/landing_page.dart';
import 'package:web_test/utilities/enums.dart';

class BackgroundLayout extends StatefulWidget {
  @override
  _BackgroundLayoutState createState() => _BackgroundLayoutState();
}

class _BackgroundLayoutState extends State<BackgroundLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF000428), Color(0xFF004e92)])),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 1010) {
              return DesktopLayout(
                content: LandingPage(type: LayoutType.desktop,),
              );
            } else {
              return Container(
                height: 400,
                color: Colors.red,
              );
            }
          },
        ),
      ),
    );
  }
}


