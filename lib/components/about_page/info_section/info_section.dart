import 'package:flutter/material.dart';
import 'package:web_test/components/about_page/info_section/info_box.dart';
import 'package:web_test/utilities/constants.dart';

class InfoSection extends StatefulWidget {
  @override
  _InfoSectionState createState() => _InfoSectionState();
}

class _InfoSectionState extends State<InfoSection> with TickerProviderStateMixin {
  AnimationController _controllerBackground;
  AnimationController _controllerInterests;
  AnimationController _controllerEducation;
  AnimationController _controllerActivities;

  @override
  void initState() {
    _controllerBackground = AnimationController(vsync: this, duration: Duration(seconds: kAboutPageAnimationDuration))..addListener(() {setState(() {

    });});
    _controllerInterests = AnimationController(vsync: this, duration: Duration(seconds: kAboutPageAnimationDuration))..addListener(() {setState(() {

    });});
    _controllerEducation = AnimationController(vsync: this, duration: Duration(seconds: kAboutPageAnimationDuration))..addListener(() {setState(() {

    });});
    _controllerActivities = AnimationController(vsync: this, duration: Duration(seconds: kAboutPageAnimationDuration))..addListener(() {setState(() {

    });});
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
    return Column(
      children: [
        InfoBox(title: 'Background', text: 'l', controller: _controllerBackground,),
        InfoBox(title: 'Interests', text: 'l', controller: _controllerInterests,),
        InfoBox(title: 'Education', text: 'l', controller: _controllerEducation,),
        InfoBox(title: 'Activities', text: 'l', controller: _controllerActivities,)
      ],
    );
  }
}
