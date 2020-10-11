import 'package:flutter/material.dart';

class CvButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      onHover: (value) {

      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.symmetric(vertical: BorderSide(color: Colors.black, width: 2.0))
        ),
      ),
    );
  }
}
