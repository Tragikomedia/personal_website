import 'package:flutter/material.dart';
import 'package:web_test/components/about_page/info_section/inverted_content.dart';
import 'package:web_test/components/reusable/button_text.dart';
import 'package:web_test/utilities/constants.dart';

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

  @override
  void initState() {
    widget.controller.addListener(() {
      if (widget.controller.value > 0.5 && !showText) {
        setState(() {
          showText = true;
        });
      } else if (widget.controller.value < 0.5 && showText) {
        showText = false;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
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
            color: !showText ? Colors.black : Colors.white,
            child: !showText
                ? Container(
                    width: 400,
                    height: kAboutButtonHeight,
                    child: Center(
                      child: ButtonText(
                        text: widget.title,
                        color: Colors.white,
                      ),
                    ))
                : Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                    width: kAboutExplanationBoxWidth,
                    height: 200,
                    child: InvertedContent(content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.text, style: TextStyle(color: Colors.red),),
                    )),
                  ),
          ),
        ),
      ),
    );
  }
}
