import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:web_test/models/link_icon_model.dart';

Map<String, LinkIconModel> iconModels = {
  'linkedin': LinkIconModel(
    icon: FontAwesomeIcons.linkedin,
    tooltip: 'LinkedIn',
    color: Color(0xFF0077B5),
    url: 'https://linkedin.com',
  ),
  'github': LinkIconModel(
      icon: FontAwesomeIcons.githubSquare,
      tooltip: 'GitHub',
      color: Color(0xFF24292E),
      url: 'https://github.com'),
  'facebook': LinkIconModel(
      icon: FontAwesomeIcons.facebookSquare,
      tooltip: 'Facebook',
      color: Color(0xFF1778F2),
      url: 'https://facebook.com'),
};