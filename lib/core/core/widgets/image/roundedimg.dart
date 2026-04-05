
import 'package:flutter/material.dart';


class RoundedImg extends StatelessWidget {
  const RoundedImg({
    super.key,
    required this.isnetworkimg,
    required this.imgurl,
    this.height = 140,
    this.width = 120,
  });
  final bool isnetworkimg;
  final String imgurl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return (isnetworkimg)
        ? Image(image: NetworkImage(imgurl))
        : Container(
            decoration: BoxDecoration(
              color: Colors.white, // Vx.white replacement
              borderRadius: BorderRadius.circular(4), // roundedSM equivalent
            ),
            height: height,
            width: width,
            padding: const EdgeInsets.all(1), // p1 equivalent
            child: Image(image: AssetImage(imgurl)),
          );
  }
}
