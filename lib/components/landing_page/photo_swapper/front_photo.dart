import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/photo_swapper/photo.dart';
import 'package:web_test/utilities/constants.dart';

class FrontPhoto extends StatelessWidget {
  FrontPhoto({@required this.controller, @required this.sequenceNumber})
      : _movingPhotoAnimation = Tween(begin: 0.0, end: 1.0)
            .chain(TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: kAnimationDuration - kFrontTranslateDuration - kFrontHideDuration),
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: kFrontTranslateDuration),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: kFrontHideDuration)
            ]))
            .animate(controller),
        _hidingPhotoAnimation = Tween(begin: 1.0, end: 0.0)
            .chain(TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: kAnimationDuration - kFrontHideDuration),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: kFrontHideDuration)
            ]))
            .animate(controller);

  final AnimationController controller;
  final Animation<double> _movingPhotoAnimation;
  final Animation<double> _hidingPhotoAnimation;
  final int sequenceNumber;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(-kDeskPhotoWidth * _movingPhotoAnimation.value, 0.0),
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: 1 - _hidingPhotoAnimation.value,
            child: Photo(
              sequenceNumber: sequenceNumber,
            ),
          ),
        ),
      ),
    );
  }
}
