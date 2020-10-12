import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/informative_section/cv_button/cv_button.dart';
import 'package:web_test/components/landing_page/informative_section/icon_row/icon_row.dart';
import 'package:web_test/components/landing_page/informative_section/name/famous_quote.dart';
import 'package:web_test/components/landing_page/informative_section/name/name_widget.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_button.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_row.dart';
import 'package:web_test/components/landing_page/photo_swapper/photo_swapper.dart';
import 'package:web_test/utilities/constants.dart';

class TabletLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NameWidget(),
        FamousQuote(),
        // Padding used due to the offset of photo movement
        Padding(
          padding: const EdgeInsets.only(left: kPhotoMaxPadding / 2),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: kDeskPhotoWidth / 2 + kPhotoMaxPadding),
              child: PhotoSwapper()),
        ),
        NavigationRow(buttons: [
          NavigationButton(text: 'About Me'),
          NavigationButton(text: 'Translations'),
        ]),
        NavigationRow(buttons: [
          NavigationButton(text: 'Contact'),
          NavigationButton(text: 'Programming')
        ]),
        CvButton(),
        IconRow()
      ],
    );
  }
}
