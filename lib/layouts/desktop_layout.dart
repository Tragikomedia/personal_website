import 'package:flutter/material.dart';
import 'package:web_test/utilities/constants.dart';

class DesktopLayout extends StatelessWidget {
  final Widget content;
  DesktopLayout({@required this.content});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(kMainPagePadding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: kMaxMainPageWidth,
              maxHeight: kMaxMainPageHeight,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.circular(10.0)),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
                child: content),
          ),
        ),
      ),
    );
  }
}