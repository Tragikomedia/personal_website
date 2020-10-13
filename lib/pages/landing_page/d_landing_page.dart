import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/informative_section/cv_button/cv_button.dart';
import 'package:web_test/components/landing_page/informative_section/icon_row/icon_row.dart';
import 'package:web_test/components/landing_page/informative_section/name/famous_quote.dart';
import 'package:web_test/components/landing_page/informative_section/name/name_widget.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_button.dart';
import 'package:web_test/components/landing_page/informative_section/navigation_buttons/navigation_row.dart';
import 'package:web_test/components/landing_page/photo_swapper/photo_swapper.dart';
import 'package:web_test/components/reusable/white_box_size_keeper.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/enums.dart';

class DesktopLandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: PhotoSwapper(),
        )),
        // SizedBox used to enable proper Column positioning
        WhiteBoxSizeKeeper(),
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: 650),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              NameWidget(),
              FamousQuote(),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ConstrainedBox(
                      constraints:
                          BoxConstraints(maxHeight: kDeskButtonHeight * 2 + 30),
                      child: Column(
                        children: [
                          NavigationRow(buttons: [
                            NavigationButton(text: 'About Me', page: CurrentPage.about,),
                            NavigationButton(text: 'Translations'),
                          ]),
                          NavigationRow(buttons: [
                            NavigationButton(text: 'Contact'),
                            NavigationButton(text: 'Programming')
                          ]),
                        ],
                      ),
                    ),
                    CvButton(),
                    IconRow()
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
