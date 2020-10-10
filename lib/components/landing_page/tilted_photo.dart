import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/photo.dart';
import 'dart:math';

class TiltedPhoto extends StatelessWidget {
  TiltedPhoto(
      {Key key,
      @required this.controller,
      @required this.imageAddress,
      @required this.tiltModifier})
      : _tiltingPhotoAnimation = Tween(begin: 0.0, end: 1.0)
            .chain(TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 3),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 4)
            ]))
            .animate(controller);

  final AnimationController controller;
  final Animation<double> _tiltingPhotoAnimation;
  final String imageAddress;
  final int tiltModifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: _tiltingPhotoAnimation.value * tiltModifier * 10),
        child: Transform.rotate(
            angle: _tiltingPhotoAnimation.value * pi / (16 / tiltModifier),
            child: Photo(
              imageAddress: imageAddress,
            )));
  }
}
