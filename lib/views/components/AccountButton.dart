import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';

class AccountButton extends StatelessWidget {
  String functionName;
  // final double fontSize;
  // final String fontFamily;
  Color fontColor;
  // final FontWeight fontWeight;
  String text;
  Color colorButton;
  late String email;
  late String password;

  // AccountButton(this.routeName, this.fontSize, this.fontFamily, this.fontColor, this.fontWeight, this.text, this.colorButton);
  PageList pageList = PageList();
  AccountButton(this.functionName, this.fontColor, this.text, this.colorButton);

  AccountButton.overloadWithEmailPassword(this.functionName, this.fontColor,
      this.text, this.colorButton, this.email, this.password);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        backgroundColor: colorButton,
        label: Text(
          text,
          style: TextStyle(color: fontColor),
        ),
        onPressed: () => {
              if (functionName == "SignIn")
                {
                  // Need to use controller to check Hr User
                  pageList.routeTo(context, "UserHome")
                }
              else if (functionName == "login")
                {pageList.routeTo(context, "SignIn")}
              else if (functionName == "SignUp")
                {pageList.routeTo(context, "SignUp")}
              else if (functionName == "Reset")
                {pageList.routeTo(context, "ResetPassword")}
              else
                {print("not found function wa sus\n $functionName")}
            });
  }
}
