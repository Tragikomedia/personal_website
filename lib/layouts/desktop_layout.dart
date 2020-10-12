import 'dart:math';
import 'package:flutter/material.dart';
import 'package:web_test/components/reusable/language_change_button.dart';
import 'package:web_test/utilities/constants.dart';

class DesktopLayout extends StatelessWidget {
  final Widget content;
  final bool isSmall;

  DesktopLayout({@required this.content, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(kMainPagePadding),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: kMaxMainPageWidth,
            maxHeight: !isSmall
                ? size.height > kMaxMainPageHeight + 2 * kMainPagePadding
                    ? kMaxMainPageHeight
                    : max(kDeskPhotoHeight + 20,
                        size.height - 2 * kMainPagePadding)
                : kDeskNameSize + kDeskQuoteSize + kDeskPhotoHeight / 2 + kDeskButtonHeight * 3 + kIconSize + 300,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: LanguageChangeButton(),
              ),
              content
            ]),
          ),
        ),
      ),
    );
  }
}
