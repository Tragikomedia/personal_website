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
      decoration: BoxDecoration(
        color: Colors.white,
            border: Border.all(color: Colors.black, width: 3.0)
      ),
      width: kDeskPhotoWidth,
      height: kDeskPhotoHeight,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Image(image: AssetImage(imageList[imageNumber]),),
      ),
    );
  }
}
