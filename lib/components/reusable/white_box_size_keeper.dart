import 'package:flutter/material.dart';
import 'dart:math';
import 'package:web_test/utilities/constants.dart';

class WhiteBoxSizeKeeper extends StatelessWidget {
  const WhiteBoxSizeKeeper({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: min(MediaQuery.of(context).size.height - 2 * kPagePadding,
          kMaxMainPageHeight),
      width: 1,
    );
  }
}