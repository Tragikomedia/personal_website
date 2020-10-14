import 'dart:math';

import 'package:flutter/material.dart';
import 'package:web_test/utilities/constants.dart';

class InvertedContent extends StatelessWidget {
  final Widget content;

  InvertedContent({
    @required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi,
      child: Transform.translate(
        offset: Offset(kAboutExplanationBoxWidth, 0),
        child: Transform(
            transform: Matrix4(-1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),
            child: content),
      ),
    );
  }
}
