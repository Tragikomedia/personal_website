import 'package:flutter/material.dart';
import 'package:web_test/utilities/constants.dart';

class LayoutMovementProtector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isSmall = MediaQuery.of(context).size.width <= kTabletThreshold;
    return Container(
      color: Colors.transparent,
      width: !isSmall ? kDeskPhotoWidth + kPhotoMaxPadding : kDeskPhotoWidth / 2 + kPhotoMaxPadding,
    );
  }
}
