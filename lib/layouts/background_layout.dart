import 'package:flutter/material.dart';
import 'package:web_test/components/drawer/drawer.dart';
import 'package:web_test/layouts/desktop_layout.dart';
import 'package:web_test/layouts/mobile_layout.dart';
import 'package:web_test/pages/about_page/about_page.dart';
import 'package:web_test/pages/landing_page/landing_page.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/enums.dart';

class BackgroundLayout extends StatefulWidget {
  @override
  _BackgroundLayoutState createState() => _BackgroundLayoutState();
}

class _BackgroundLayoutState extends State<BackgroundLayout> {
  CurrentPage page = CurrentPage.about;

  _determinePage(LayoutType type) {
    switch (page) {
      case CurrentPage.landing:
        return LandingPage(type: type);
        break;
      case CurrentPage.about:
        return AboutPage(type: type);
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
        child: Center(
          child: SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > kDesktopThreshold) {
                  return DesktopLayout(
                    content: _determinePage(LayoutType.desktop),
                  );
                } else if (constraints.maxWidth > kTabletThreshold) {
                  return DesktopLayout(isSmall: true,content: _determinePage(LayoutType.tablet));
                } else {
                  return MobileLayout(content: _determinePage(LayoutType.mobile));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
