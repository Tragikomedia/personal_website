import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/informative_section/cv_button/cv_button.dart';
import 'package:web_test/components/landing_page/informative_section/icon_row/icon_row.dart';
import 'package:web_test/components/landing_page/informative_section/name/famous_quote.dart';
import 'package:web_test/components/landing_page/informative_section/name/name_widget.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_button.dart';
import 'package:web_test/components/landing_page/photo_swapper/photo_swapper.dart';
import 'package:web_test/utilities/constants.dart';

class MobileLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
          child: FittedBox(fit: BoxFit.fitWidth,child: ConstrainedBox(constraints: BoxConstraints(minWidth: MediaQuery.of(context).size.width),child: NameWidget())),
        ),
        FamousQuote(),
        Padding(
          padding: const EdgeInsets.only(left: kPhotoMaxPadding / 2, top: 20.0, bottom: 20.0),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: kDeskPhotoWidth / 2 + kPhotoMaxPadding),
              child: PhotoSwapper()),
        ),
        NavigationButton(text: 'About Me'),
        NavigationButton(text: 'Translations'),
        NavigationButton(text: 'Programming'),
        NavigationButton(text: 'Contact'),
        IconRow(),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: CvButton(),
        ),
      ],
    );
  }
}
