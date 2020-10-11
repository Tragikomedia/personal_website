import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/informative_section/icon_row/icon_row.dart';
import 'package:web_test/components/landing_page/informative_section/name/name_widget.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_button.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_row.dart';
import 'package:web_test/components/reusable/formatted_text.dart';
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
            NameWidget(),
            IconRow(),
            NavigationRow(buttons: [NavigationButton(text: 'About Me'), NavigationButton(text: 'Translations'),]),
            NavigationRow(buttons: [NavigationButton(text: 'Contact'), NavigationButton(text: 'Programming')]),
          ],
        ),
      ],
    );
  }
}


