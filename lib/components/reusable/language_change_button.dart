import 'package:flutter/material.dart';
import 'package:web_test/utilities/data_sets.dart';
import 'package:web_test/utilities/enums.dart';
import 'package:web_test/models/language.dart';

import 'button_text.dart';

class LanguageChangeButton extends StatelessWidget {

  PopupMenuItem _getLanguageButton(Language lang) {
    return PopupMenuItem(child: ButtonText(text: lang.description, size: 15));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      initialValue: LanguageCode.eng,
        // TODO onSelected
        onSelected: (value) {},
        child: Row( mainAxisSize: MainAxisSize.min,children: [ButtonText(text: languages[0].abbreviation, size: 15.0,), Icon(Icons.arrow_drop_down, color: Colors.black,)]),
        itemBuilder: (context) => languages.map((lang) => _getLanguageButton(lang)).toList());
  }
}
