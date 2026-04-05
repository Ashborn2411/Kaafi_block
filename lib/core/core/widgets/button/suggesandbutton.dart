
import 'package:flutter/material.dart';

class Suggandbutton extends StatelessWidget {
  const Suggandbutton({
    super.key,
    required this.title,
    required this.buttontitle,
    required this.buttontitlecolor,
    required this.ontap,
    this.titlecolor = const Color(0xFF9E9E9E), // Vx.gray500 replacement
  });

  final String title;
  final Color titlecolor;
  final String buttontitle;
  final Color buttontitlecolor;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: titlecolor,
            fontWeight: FontWeight.w600, // semiBold equivalent
          ),
        ),
        GestureDetector(
          onTap: ontap,
          child: Text(
            buttontitle,
            style: TextStyle(
              color: buttontitlecolor,
              fontWeight: FontWeight.w800, // extraBold equivalent
            ),
          ),
        ),
      ],
    );
  }
}
