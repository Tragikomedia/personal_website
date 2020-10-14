import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_test/components/reusable/button_text.dart';
import 'package:web_test/utilities/enums.dart';
import 'package:web_test/viewmodels/current_page_viewmodel.dart';

class DrawerButton extends StatelessWidget {
  final String text;
  final CurrentPage page;

  DrawerButton({@required this.text, this.page});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListTile(
          onTap: () {
            Provider.of<CurrentPageViewModel>(context, listen: false).newPage =
                page;
          },
          leading: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
          title: ButtonText(
            text: text,
            color: Colors.white,
            size: 15,
          )),
    );
  }
}
