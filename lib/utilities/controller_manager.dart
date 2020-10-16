import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class InfoBoxControllerManager extends ChangeNotifier{
  AnimationController _activeController;

  void showInfoBox(AnimationController controller) {
    if (_activeController != null) {
      _activeController.reverse();
    }
    controller.forward();
    _activeController = controller;
  }

  void hideInfoBox() {
    _activeController.reverse();
    _activeController = null;
  }

}