import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/tilted_photo.dart';
import 'package:web_test/components/landing_page/front_photo.dart';
import 'package:web_test/utilities/constants.dart';

class PhotoSwapper extends StatefulWidget {
  @override
  _PhotoSwapperState createState() => _PhotoSwapperState();
}

class _PhotoSwapperState extends State<PhotoSwapper>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _sequenceNumber = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: kAnimationDuration), vsync: this)
          ..addListener(() {
            setState(() {
            });
          })..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reset();
              _sequenceNumber++;
              _controller.forward();
            }
        });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TiltedPhoto(
        controller: _controller,
        tiltModifier: 2,
        sequenceNumber: _sequenceNumber + 2,
      ),
      TiltedPhoto(
        controller: _controller,
        tiltModifier: 1,
        sequenceNumber: _sequenceNumber + 1,
      ),
      FrontPhoto(
        controller: _controller,
        sequenceNumber: _sequenceNumber,
      ),
    ]);
  }
}
