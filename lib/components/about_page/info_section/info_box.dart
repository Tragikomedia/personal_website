import 'package:flutter/material.dart';
import 'package:web_test/components/reusable/button_text.dart';

class InfoBox extends StatefulWidget {
  final String title;
  final String text;
  final AnimationController controller;
  final Animation<double> translateAnimation;
  final Animation<double> matrixAnimation;

  InfoBox(
      {@required this.title, @required this.text, @required this.controller})
      : translateAnimation = Tween(begin: 0.0, end: 600.0).animate(controller),
        matrixAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);

  @override
  _InfoBoxState createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  bool showText = false;
  double x = 3;
  double y = 0;
  double z = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.value > 0.5 && !showText) {
        setState(() {
          showText = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: Offset(widget.translateAnimation.value, 0.0),
          child: InkWell(
            onTap: () {
              if (widget.controller.status == AnimationStatus.dismissed) {
                widget.controller.forward();
              } else {
                widget.controller.reverse();
              }
            },
            child: Transform(
              transform: Matrix4(
                1,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                1,
                0,
                0,
                0,
                0,
                1,
              )
                ..rotateX(x*widget.matrixAnimation.value),
              child: Card(
                color: Colors.black,
                child: !showText
                    ? Container(
                        width: 400,
                        height: 100,
                        child: Center(
                          child: ButtonText(
                            text: widget.title,
                            color: Colors.white,
                          ),
                        ))
                    : Container(
                        width: 400,
                        height: 200,
                        color: Colors.red,
                      ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
