import 'package:flutter/material.dart';

class RowTextField extends StatelessWidget {
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final String text;
  final String hintText;
  final TextEditingController textController;

  RowTextField(this.fontSize, this.fontFamily, this.fontWeight, this.text,
      this.hintText, this.textController);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$text :",
            style: TextStyle(
                fontSize: fontSize,
                fontFamily: fontFamily,
                fontWeight: fontWeight),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: TextFormField(
              validator: (value) =>
                value!.isEmpty ? 'Input cannot be empty!' : null,
              controller: textController,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(top: 5),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                hintText: "  $hintText",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
