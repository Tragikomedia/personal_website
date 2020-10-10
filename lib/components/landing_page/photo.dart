import 'package:flutter/material.dart';
import 'package:web_test/utilities/constants.dart';

class Photo extends StatelessWidget {
  final String imageAddress;

  Photo({@required this.imageAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kDeskPhotoWidth,
      height: kDeskPhotoHeight,
      child: Image(image: AssetImage(imageAddress),),
    );
  }
}
