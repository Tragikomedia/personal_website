import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/components/drawer/drawer.dart';
import 'package:web_test/data_sets/pages.dart';
import 'package:web_test/layouts/desktop_layout.dart';
import 'package:web_test/layouts/mobile_layout.dart';
import 'package:web_test/pages/responsive_handler/responsive_handler.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/enums.dart';
import 'package:web_test/notifiers/current_page_notifier.dart';

class BackgroundLayout extends StatefulWidget {
  @override
  _BackgroundLayoutState createState() => _BackgroundLayoutState();
}

class _BackgroundLayoutState extends State<BackgroundLayout> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: kBackgroundColors + kBackgroundColors.reversed.toList())),
        child: Center(
          child: SingleChildScrollView(
            child: Consumer<CurrentPageNotifier>(
              builder: (context, currentPage, child) =>
               LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > kDesktopThreshold) {
                    return DesktopLayout(
                      content: ResponsivePageHandler(page: pages[currentPage.currentPage], type: LayoutType.desktop),
                    );
                  } else if (constraints.maxWidth > kTabletThreshold) {
                    return DesktopLayout(isSmall: true,content: ResponsivePageHandler(page: pages[currentPage.currentPage], type: LayoutType.tablet));
                  } else {
                    return MobileLayout(content: ResponsivePageHandler(page: pages[currentPage.currentPage], type: LayoutType.mobile));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
