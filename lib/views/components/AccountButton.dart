import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';

class AccountButton extends StatelessWidget {
  final String routeName;
  // final double fontSize;
  // final String fontFamily;
  final Color fontColor;
  // final FontWeight fontWeight;
  final String text;
  final Color colorButton;

  // AccountButton(this.routeName, this.fontSize, this.fontFamily, this.fontColor, this.fontWeight, this.text, this.colorButton);
  AccountButton(this.routeName, this.fontColor, this.text, this.colorButton);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended (
      backgroundColor: colorButton,
      label: Text(text, style: TextStyle(color: fontColor),),
      onPressed: () => {
        PageList().routeTo(context, routeName)
      }
    );
  }
}