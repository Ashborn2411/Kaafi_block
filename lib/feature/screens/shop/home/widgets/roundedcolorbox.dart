
import 'package:flutter/material.dart';


class RoundedColoredBox extends StatelessWidget {
  final Color color;
  final double width;
  final double height;

  const RoundedColoredBox({
    super.key,
    required this.color,
    this.width = 8,
    this.height = 35,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius:
            BorderRadius.circular(4), // Use width for rounded corner radius
      ),
    );
  }
}