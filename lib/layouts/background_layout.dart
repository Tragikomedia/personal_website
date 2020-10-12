import 'package:flutter/material.dart';
import 'package:web_test/components/drawer/drawer.dart';
import 'package:web_test/layouts/desktop_layout.dart';
import 'package:web_test/layouts/mobile_layout.dart';
import 'package:web_test/pages/landing_page/landing_page.dart';
import 'package:web_test/utilities/enums.dart';

class BackgroundLayout extends StatefulWidget {
  @override
  _BackgroundLayoutState createState() => _BackgroundLayoutState();
}

class _BackgroundLayoutState extends State<BackgroundLayout> {
  CurrentPage page = CurrentPage.landing;

  _determinePage(LayoutType type) {
    switch (page){
      case CurrentPage.landing:
        return LandingPage(type: type);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF000428), Color(0xFF004e92)])),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1010) {
                return DesktopLayout(
                  content: _determinePage(LayoutType.desktop),
                );
              } else {
                return MobileLayout(content: _determinePage(LayoutType.mobile));
              }
            },
          ),
        ),
      ),
    );
  }
}


