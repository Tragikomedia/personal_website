import 'package:flutter/material.dart';
import 'package:web_test/pages/about_page/d_about_page.dart';
import 'package:web_test/utilities/enums.dart';

class AboutPage extends StatelessWidget {
  final LayoutType type;

  AboutPage({@required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LayoutType.desktop:
        return DesktopAboutPage();
      case LayoutType.mobile:
        return DesktopAboutPage();
      default:
        return DesktopAboutPage();
    }
  }
}
