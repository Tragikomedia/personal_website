import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/photo_swapper/photo.dart';
import 'dart:math';
import 'package:web_test/utilities/constants.dart';

class TiltedPhoto extends StatelessWidget {
  TiltedPhoto(
      {Key key,
      @required this.controller,
      @required this.sequenceNumber,
      @required this.tiltModifier})
      : _tiltingPhotoAnimation = Tween(begin: 0.0, end: 1.0)
            .chain(TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: kTiltDuration),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: kWaitForTiltDuration),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: kTiltDuration),
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: kAnimationDuration - 2 * kTiltDuration - kWaitForTiltDuration)
            ]))
            .animate(controller);

  final AnimationController controller;
  final Animation<double> _tiltingPhotoAnimation;
  final int sequenceNumber;
  final int tiltModifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: _tiltingPhotoAnimation.value * tiltModifier * 10),
        child: Transform.rotate(
            angle: _tiltingPhotoAnimation.value * pi / (16 / tiltModifier),
            child: Photo(
              sequenceNumber: sequenceNumber,
            )));
  }
}
