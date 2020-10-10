import 'package:flutter/material.dart';
import 'package:web_test/pages/landing_page/d_landing_page.dart';
import 'package:web_test/utilities/enums.dart';

class LandingPage extends StatelessWidget {
  final LayoutType type;

  LandingPage({@required this.type});

  @override
  Widget build(BuildContext context) {
    return type == LayoutType.desktop ?
        DesktopLandingPage()
    : SizedBox.shrink()
    ;
  }
}
