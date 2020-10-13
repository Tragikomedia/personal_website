import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/components/drawer/drawer.dart';
import 'package:web_test/data_sets/pages.dart';
import 'package:web_test/layouts/desktop_layout.dart';
import 'package:web_test/layouts/mobile_layout.dart';
import 'package:web_test/models/pageModel.dart';
import 'package:web_test/pages/responsive_handler/responsive_handler.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/enums.dart';
import 'package:web_test/viewmodels/current_page_viewmodel.dart';

class BackgroundLayout extends StatefulWidget {
  @override
  _BackgroundLayoutState createState() => _BackgroundLayoutState();
}

class _BackgroundLayoutState extends State<BackgroundLayout> {

  _determinePage(PageModel page, LayoutType type) {
    return ResponsivePageHandler(page: page, type: type);
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
            child: Consumer<CurrentPageViewModel>(
              builder: (context, currentPage, child) =>
               LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > kDesktopThreshold) {
                    return DesktopLayout(
                      content: _determinePage(pages[currentPage.currentPage], LayoutType.desktop),
                    );
                  } else if (constraints.maxWidth > kTabletThreshold) {
                    return DesktopLayout(isSmall: true,content: _determinePage(pages[currentPage.currentPage], LayoutType.tablet));
                  } else {
                    return MobileLayout(content: _determinePage(pages[currentPage.currentPage], LayoutType.mobile));
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
