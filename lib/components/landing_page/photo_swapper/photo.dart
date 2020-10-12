import 'package:flutter/material.dart';
import 'package:web_test/utilities/constants.dart';

class Photo extends StatelessWidget {
  final int sequenceNumber;
  final int imageNumber;

  Photo({@required this.sequenceNumber}):
  imageNumber = sequenceNumber % imageList.length;

  @override
  Widget build(BuildContext context) {
    bool isSmall = MediaQuery.of(context).size.width <= kDesktopThreshold;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
            border: Border.all(color: Colors.black, width: 3.0)
      ),
      width: !isSmall ? kDeskPhotoWidth : kDeskPhotoWidth / 2,
      height: !isSmall ? kDeskPhotoHeight : kDeskPhotoHeight / 2,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image(image: AssetImage(imageList[imageNumber]),),
      ),
    );
  }
}
