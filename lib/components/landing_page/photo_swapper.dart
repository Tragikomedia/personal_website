import 'package:flutter/material.dart';
import 'dart:math';

class PhotoSwapper extends StatefulWidget {
  @override
  _PhotoSwapperState createState() => _PhotoSwapperState();
}

class _PhotoSwapperState extends State<PhotoSwapper>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Future.delayed(Duration(seconds: 2), () {
                controller.reverse();
              });
            } else if (status == AnimationStatus.dismissed) {
              Future.delayed(Duration(seconds: 2), () {
                controller.forward();
              });
            }
          });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      TiltedPhoto(
        padding: controller.value * 20,
        angle: controller.value * pi / 8,
        color: Colors.yellow,
      ),
      TiltedPhoto(
        padding: controller.value * 10,
        angle: controller.value * pi / 16,
        color: Colors.green,
      ),
      ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: 1 - controller.value,
            child: PlaceholdCont(
              color: Colors.blue,
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
