import 'package:flutter/material.dart';
import 'package:web_test/utilities/constants.dart';

class Photo extends StatelessWidget {
  final int sequenceNumber;
  final int imageNumber;

  Photo({@required this.sequenceNumber}):
  imageNumber = sequenceNumber % imageList.length;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kDeskPhotoWidth,
      height: kDeskPhotoHeight,
      child: Image(image: AssetImage(imageList[imageNumber]),),
    );
  }
}
