import 'package:flutter/material.dart';
import 'package:hr/controllers/PageList.dart';

class IconPicture extends StatelessWidget {
  // final double pictureWidth;
  // final double pictureHeight;
  final double iconSize;
  final String imagePath;
  final String routeName;

  IconPicture(this.iconSize, this.imagePath, this.routeName);
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        width: MediaQuery.of(context).size.width * 0.080,
        height: MediaQuery.of(context).size.width * 0.080,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(360),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      iconSize: iconSize,
      onPressed: () => {
        PageList().routeTo(context, routeName)
      },
    );
  }
}
