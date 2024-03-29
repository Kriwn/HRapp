// import 'package:flutter/material.dart';

// class IconPicture extends StatelessWidget {
//   final double pictureWidth;
//   final double pictureHeight;
//   final double containerRoundness;
//   final String imagePath;
//   var page;

//   IconPicture(this.pictureWidth, this.pictureHeight, this.containerRoundness,
//       this.imagePath, this.page);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Container(
//         width: MediaQuery.of(context).size.width * 0.080,
//         height: MediaQuery.of(context).size.width * 0.080,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(360),
//           child: Image.asset(
//             'assets/images/bigprk.png',
//             fit: BoxFit.cover,
//           ),
//         ),
//       ),
//       iconSize: 50,
//       onPressed: () => {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const page),
//         )
//       },
//     );
//   }
// }
