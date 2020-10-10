import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/informative_section/icon_row/icon_row.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/components/landing_page/photo_swapper/photo_swapper.dart';
import 'dart:math';

class DesktopLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: PhotoSwapper()),
        // SizedBox used to enable proper Column positioning
        SizedBox(
          height: min(MediaQuery.of(context).size.height - 2 * kMainPagePadding,
              kMaxMainPageHeight),
          width: 1,
        ),
        Column(
          children: [
            SelectableText(
              'LOLOLO',
              style: TextStyle(fontSize: 80),
            ),
            IconRow()
          ],
        ),
      ],
    );
  }
}


