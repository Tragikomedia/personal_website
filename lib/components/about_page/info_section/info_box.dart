import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/components/about_page/info_section/inverted_content.dart';
import 'package:web_test/components/reusable/button_text.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/controller_manager.dart';

class InfoBox extends StatefulWidget {
  final String title;
  final String text;
  final double verticalOffset;
  final AnimationController controller;
  final Animation<double> horizontalTranslateAnimation;
  final Animation<double> verticalTranslateAnimation;
  final Animation<double> matrixAnimation;

  InfoBox(
      {@required this.title, @required this.text, @required this.controller, this.verticalOffset})
      : horizontalTranslateAnimation = Tween(begin: 0.0, end: 600.0).animate(controller),
        verticalTranslateAnimation = Tween(begin: 0.0, end: verticalOffset).animate(controller),
        matrixAnimation = Tween(begin: 0.0, end: 1.0).animate(controller);

  @override
  _InfoBoxState createState() => _InfoBoxState();
}

class _InfoBoxState extends State<InfoBox> {
  bool showText = false;

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
      offset: Offset(widget.horizontalTranslateAnimation.value, widget.verticalTranslateAnimation.value),
      child: InkWell(
        onTap: () {
          Provider.of<InfoBoxControllerManager>(context, listen: false).showInfoBox(widget.controller);
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
            ..setEntry(3, 2, 0.005)..rotateX(pi * widget.controller.value),
          child: Card(
            color: !showText ? Colors.black : Colors.white,
            child: !showText
                ? Container(
                    width: kAboutExplanationBoxWidth - 100,
                    height: kAboutButtonHeight,
                    child: Center(
                      child: ButtonText(
                        text: widget.title,
                        color: Colors.white,
                      ),
                    ))
                : Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 3)),
                    width: kAboutExplanationBoxWidth,
                    height: 4 * (kAboutButtonHeight+0.5*kAboutButtonSpacing),
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
