import 'package:flutter/material.dart';
import 'package:web_test/models/pageModel.dart';
import 'package:web_test/utilities/enums.dart';

class ResponsivePageHandler extends StatelessWidget {
  final PageModel page;
  final LayoutType type;

  ResponsivePageHandler({@required this.page, @required this.type});

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LayoutType.desktop:
        return page.desktopVersion;
      case LayoutType.mobile:
        return page.mobileVersion;
      default:
        return page.tabletVersion;
    }
  }
}
