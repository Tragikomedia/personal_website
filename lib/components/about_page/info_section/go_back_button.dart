import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/components/reusable/button_text.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/controller_manager.dart';

class GoBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<InfoBoxControllerManager>(context, listen: false).hideInfoBox();
      },
      child: Container(
        height: kAboutButtonHeight,
        width: kAboutExplanationBoxWidth - 100,
        child: Center(child: ButtonText(text: 'Go Back',)),
      ),
    );
  }
}
