import 'package:flutter/material.dart';

class AccountTextField extends StatelessWidget {
  final Icon icon;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final String text;
  final String hintText;
  final TextEditingController textController;

  AccountTextField(this.icon, this.fontSize, this.fontFamily, this.fontWeight,
      this.text, this.hintText, this.textController);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            icon,
            Text(
              text,
              style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: fontFamily,
                  fontWeight: fontWeight),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(100.0, 5.0, 100.0, 0),
          child: TextField(
            controller: textController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hintText,
            ),
          ),
        ),
      ],
    );
  }
}
