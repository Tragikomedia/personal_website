import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/informative_section/icon_row/link_icon.dart';
import 'package:web_test/data_sets/icons.dart';
import 'package:web_test/utilities/constants.dart';

class IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LinkIcon(data: iconModels['linkedin'],),
        SizedBox(width: kIconSpacing,),
        LinkIcon(data: iconModels['github'],),
        SizedBox(width: kIconSpacing,),
        LinkIcon(data: iconModels['facebook'],),
      ],
    );
  }
}
