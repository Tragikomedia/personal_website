import 'package:flutter/material.dart';
import 'package:web_test/components/about_page/info_section/go_back_button.dart';

class OptionBox extends StatelessWidget {
  final Widget child;

  OptionBox({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoBackButton(),
        child
      ],
    );
  }
}
