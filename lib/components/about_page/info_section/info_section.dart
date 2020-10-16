import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/components/about_page/info_section/info_box.dart';
import 'package:web_test/components/about_page/info_section/option_box.dart';
import 'package:web_test/utilities/constants.dart';
import 'package:web_test/utilities/controller_manager.dart';

class InfoSection extends StatefulWidget {
  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection>
    with TickerProviderStateMixin {
  AnimationController _controllerBackground;
  AnimationController _controllerInterests;
  AnimationController _controllerEducation;
  AnimationController _controllerActivities;

  @override
  void initState() {
    _controllerBackground = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: kAboutPageAnimationDuration))
      ..addListener(() {
        setState(() {});
      });
    _controllerInterests = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: kAboutPageAnimationDuration))
      ..addListener(() {
        setState(() {});
      });
    _controllerEducation = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: kAboutPageAnimationDuration))
      ..addListener(() {
        setState(() {});
      });
    _controllerActivities = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: kAboutPageAnimationDuration))
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controllerBackground?.dispose();
    _controllerInterests?.dispose();
    _controllerEducation?.dispose();
    _controllerActivities?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double horizontalOffset = min(MediaQuery.of(context).size.width, kMaxMainPageWidth) - kAboutExplanationBoxWidth - 100;
    return Padding(
      padding: const EdgeInsets.only(left: kAboutPadding),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: (kAboutButtonHeight + kAboutButtonSpacing) * 4),
        child: ChangeNotifierProvider(
          create: (context) => InfoBoxControllerManager(),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  child: OptionBox(
                    child: InfoBox(
                      title: 'Background',
                      text: '',
                      horizontalOffset: horizontalOffset,
                      verticalOffset:
                          4 * kAboutButtonHeight + 3 * kAboutButtonSpacing,
                      controller: _controllerBackground,
                    ),
                  )),
              Positioned(
                  top: kAboutButtonHeight + kAboutButtonSpacing,
                  child: OptionBox(
                    child: InfoBox(
                      title: 'Interests',
                      text: 'l',
                      horizontalOffset: horizontalOffset,
                      verticalOffset:
                          3 * kAboutButtonHeight + 2 * kAboutButtonSpacing,
                      controller: _controllerInterests,
                    ),
                  )),
              Positioned(
                  top: 2 * (kAboutButtonHeight + kAboutButtonSpacing),
                  child: OptionBox(
                    child: InfoBox(
                      title: 'Education',
                      text:
                          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                      horizontalOffset: horizontalOffset,
                      verticalOffset:
                          kAboutButtonHeight * 2 + kAboutButtonSpacing,
                      controller: _controllerEducation,
                    ),
                  )),
              Positioned(
                  top: 3 * (kAboutButtonHeight + kAboutButtonSpacing),
                  child: OptionBox(
                    child: InfoBox(
                      title: 'Activities',
                      text: 'l',
                      horizontalOffset: horizontalOffset,
                      verticalOffset: kAboutButtonHeight,
                      controller: _controllerActivities,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
