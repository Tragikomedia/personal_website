import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/photo.dart';
import 'package:web_test/utilities/constants.dart';

class FrontPhoto extends StatelessWidget {
  FrontPhoto({@required this.controller, @required this.imageAddress})
      : _movingPhotoAnimation = Tween(begin: 0.0, end: 1.0)
            .chain(TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 5),
              TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 2),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 2)
            ]))
            .animate(controller),
        _hidingPhotoAnimation = Tween(begin: 1.0, end: 0.0)
            .chain(TweenSequence([
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 7),
              TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 2)
            ]))
            .animate(controller);

  final AnimationController controller;
  final Animation<double> _movingPhotoAnimation;
  final Animation<double> _hidingPhotoAnimation;
  final String imageAddress;

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
              imageAddress: imageAddress,
            ),
          ),
        ),
      ),
    );
  }
}
