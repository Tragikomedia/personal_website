import 'package:flutter/material.dart';
import 'package:web_test/components/reusable/button_text.dart';
import 'package:web_test/utilities/constants.dart';

class NavigationButton extends StatefulWidget {
  final String text;
  
  NavigationButton({@required this.text});

  @override
  _NavigationButtonState createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 3),);
    _colorAnimation = TweenSequence([
      TweenSequenceItem(tween: ColorTween(begin: kDefaultButtonColor, end: kAnimatedButtonColor1), weight: 1),
      TweenSequenceItem(tween: ColorTween(begin: kAnimatedButtonColor1, end: kAnimatedButtonColor2), weight: 1),
      TweenSequenceItem(tween: ColorTween(begin: kAnimatedButtonColor2, end: kDefaultButtonColor), weight: 1),
    ]).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: AnimatedBuilder(
        animation: _colorAnimation,
        builder: (context, child) => InkWell(
          onTap: (){},
          onHover: (value) {
            if (value) {
              _controller.repeat();
            } else {
              _controller.reset();
            }
          },
          child: Card(
            elevation: 20.0,
            shadowColor: _colorAnimation.value,
            color: _colorAnimation.value,
            child: Container(
              height: kDeskButtonHeight,
              width: kDeskButtonWidth,
              child: Center(
                child: ButtonText(
                  text: widget.text,
                  color: Colors.white,
                  size: 25.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
