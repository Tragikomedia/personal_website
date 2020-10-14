import 'package:flutter/material.dart';
import 'package:web_test/components/about_page/header/header.dart';
import 'package:web_test/components/about_page/info_section/info_section.dart';

class DesktopAboutPage extends StatefulWidget {
  @override
  _DesktopAboutPageState createState() => _DesktopAboutPageState();
}

class _DesktopAboutPageState extends State<DesktopAboutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(alignment: Alignment.topCenter,child: AboutHeader()),
          Spacer(),
          Align(alignment: Alignment.centerLeft,child: InfoSection()),
          Spacer()
        ],
      ),
    );
  }
}
