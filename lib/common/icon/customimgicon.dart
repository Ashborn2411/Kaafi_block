import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class Customimageicon extends StatelessWidget {
  const Customimageicon({
    super.key,
    required this.ontap,
    this.img = ImageCons.sort,
    this.iconcolor = Colors.black, // Vx.black replacement
    this.bgcolor = Colors.white, // Vx.white replacement
    this.size = 20,
  });
  final VoidCallback ontap;
  final String img;
  final Color iconcolor;
  final Color bgcolor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: CircleAvatar(
        radius: 20,
        backgroundColor: bgcolor,
        child: ImageIcon(AssetImage(img), size: size, color: iconcolor),
      ),
    );
  }
}
