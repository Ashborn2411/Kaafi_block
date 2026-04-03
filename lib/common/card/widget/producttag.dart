
import 'package:flutter/material.dart';


class ProductTag extends StatelessWidget {
  const ProductTag({
    super.key,
    required this.tag,
  });
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 126, 34, 206),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0), // Adjust radius for top right corner
          // Set bottom right corner to sharp
          bottomLeft:
              Radius.circular(10.0), // Adjust radius for bottom left corner
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          tag,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400), // Text color
        ),
      ),
    );
  }
}
