import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_test/models/link_icon_model.dart';
import 'package:web_test/utilities/constants.dart';

class LinkIcon extends StatefulWidget {
  final LinkIconModel data;

  LinkIcon({@required this.data});

  @override
  _LinkIconState createState() => _LinkIconState();
}

class _LinkIconState extends State<LinkIcon> {
  Color color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
        message: widget.data.tooltip,
        child: InkWell(
          onTap: () async {
            if (await canLaunch(widget.data.url)) {
              await launch(widget.data.url);
            }
          },
          onHover: (value) {
            if (value) {
              setState(() {
                color = widget.data.color;
              });
            } else {
              setState(() {
                color = Colors.black;
              });
            }
          },
          child: FaIcon(
            widget.data.icon,
            size: kIconSize,
            color: color,
          ),
        ));
  }
}
