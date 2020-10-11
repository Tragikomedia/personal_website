import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_test/components/reusable/button_text.dart';
import 'package:web_test/utilities/constants.dart';

class CvButton extends StatefulWidget {
  @override
  _CvButtonState createState() => _CvButtonState();
}

class _CvButtonState extends State<CvButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _backgroundAnimation;
  Animation<Color> _borderAnimation1;
  Animation<Color> _borderAnimation2;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..addListener(() {
            setState(() {});
          });
    _backgroundAnimation =
        ColorTween(begin: Colors.transparent, end: kAnimatedButtonColor1)
            .animate(_controller);
    _borderAnimation1 = ColorTween(begin: Colors.black, end: Colors.transparent)
        .animate(_controller);
    _borderAnimation2 = ColorTween(begin: Colors.transparent, end: Colors.black)
        .animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await launch(
            'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf');
      },
      onHover: (value) {
        if (value) {
          _controller.repeat(reverse: true);
        } else {
          _controller.reset();
        }
      },
      child: Container(
        height: kDeskButtonHeight,
        width: kDeskButtonWidth,
        decoration: BoxDecoration(
            color: _backgroundAnimation.value,
            border: Border.symmetric(
                horizontal:
                    BorderSide(color: _borderAnimation1.value, width: 2.0),
                vertical:
                    BorderSide(color: _borderAnimation2.value, width: 2.0))),
        child: Center(
          child: ButtonText(
            text: 'Download CV',
          ),
        ),
      ),
    );
  }
}
