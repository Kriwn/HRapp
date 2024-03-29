// import 'package:flutter/material.dart';
// import 'package:hr/views/HR/homepage.dart';

// class CustomButton extends StatefulWidget {
//   CustomButton({super.key, required this.textColor, required this.backgroundColor, required this.text, required this.page});
//   Color textColor;
//   Color backgroundColor;
//   String text;
//   var page;

//   @override
//   State<CustomButton> createState() => _CustomButtonState(textColor: textColor, backgroundColor: backgroundColor, text: text, page: page);
// }

// class _CustomButtonState extends State<CustomButton> {
//   _CustomButtonState({required this.textColor, required this.backgroundColor, required this.text, required this.page});
//   Color textColor;
//   Color backgroundColor;
//   String text;
//   var page;

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       //Sign in button
//       backgroundColor: const Color.fromARGB(255, 30, 95, 116),
//       child: const Text(
//         "Sign in",
//         style: TextStyle(color: textColor),
//       ),
//       onPressed: () => {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HrHomepage()),
//         )
//       }
//     );
//   }
// }
