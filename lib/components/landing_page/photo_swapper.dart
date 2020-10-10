import 'package:flutter/material.dart';
import 'package:web_test/components/landing_page/tilted_photo.dart';

import 'package:web_test/components/landing_page/front_photo.dart';

class PhotoSwapper extends StatefulWidget {
  @override
  _PhotoSwapperState createState() => _PhotoSwapperState();
}

class _PhotoSwapperState extends State<PhotoSwapper>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 9), vsync: this)
          ..addListener(() {
            setState(() {});
          });
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
        controller: _controller,
        tiltModifier: 2,
        imageAddress: 'assets/photo1.jpg',
      ),
      TiltedPhoto(
        controller: _controller,
        tiltModifier: 1,
        imageAddress: 'assets/photo2.jpg',
      ),
      FrontPhoto(controller: _controller, imageAddress: 'assets/photo3.jpg',),
    ]);
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
