import 'package:flutter/material.dart';
import 'package:web_test/utilities/enums.dart';

class PageModel {
final CurrentPage pageId;
final Widget desktopVersion;
final Widget tabletVersion;
final Widget mobileVersion;

PageModel({@required this.pageId, @required this.desktopVersion, @required this.tabletVersion, @required this.mobileVersion});

}