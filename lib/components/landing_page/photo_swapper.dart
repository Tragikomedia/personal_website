import 'package:flutter/material.dart';
import 'dart:math';

class PhotoSwapper extends StatefulWidget {
  @override
  _PhotoSwapperState createState() => _PhotoSwapperState();
}

class _PhotoSwapperState extends State<PhotoSwapper>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _tiltingPhotoAnimation;
  Animation<double> _movingPhotoAnimation;
  Animation<double> _hidingPhotoAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 9), vsync: this)
          ..addListener(() {
            setState(() {});
          });
    _tiltingPhotoAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 1),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 3),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 1),
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 4)
        ]))
        .animate(_controller);
    _movingPhotoAnimation = Tween(begin: 0.0, end: 1.0)
        .chain(TweenSequence([
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 5),
          TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 2),
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 2)
        ]))
        .animate(_controller);
    _hidingPhotoAnimation = Tween(begin: 1.0, end: 0.0).chain(TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 7),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 2)
    ])).animate(_controller);
    _controller.repeat();
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
        padding: _tiltingPhotoAnimation.value * 20,
        angle: _tiltingPhotoAnimation.value * pi / 8,
        color: Colors.yellow,
      ),
      TiltedPhoto(
        padding: _tiltingPhotoAnimation.value * 10,
        angle: _tiltingPhotoAnimation.value * pi / 16,
        color: Colors.green,
      ),
      Transform.translate(
        offset: Offset(-400 * _movingPhotoAnimation.value, 0.0),
        child: ClipRect(
          child: Container(
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1 - _hidingPhotoAnimation.value,
              child: PlaceholdCont(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}

class TiltedPhoto extends StatelessWidget {
  const TiltedPhoto({Key key, this.padding, this.angle, this.color});

  final double padding;
  final double angle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: padding),
        child:
            Transform.rotate(angle: angle, child: PlaceholdCont(color: color)));
  }
}

class PlaceholdCont extends StatelessWidget {
  final Color color;

  PlaceholdCont({this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 550,
      color: color,
    );
  }
}
