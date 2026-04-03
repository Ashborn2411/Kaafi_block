import '/exports/data_paths.dart';

import 'package:flutter/material.dart';


class TitleSubtitleandButton extends StatelessWidget {
  const TitleSubtitleandButton({
    super.key,
    required this.ontap,
    required this.title,
    required this.subtitle,
    required this.color,
  });
  final VoidCallback ontap;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            RoundedColoredBox(color: color),
            const SizedBox(width: 10), // 10.widthBox replacement
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(
                      color: Colors.black, // Vx.black replacement
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: '\n$subtitle',
                    style: const TextStyle(
                      color: Colors.black, // Vx.black replacement
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white, // Vx.white replacement
              borderRadius: BorderRadius.circular(4), // rounded equivalent
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Text("Show More"), // .text.make() replacement
          ), // .box.color().rounded.padding().make() replacement
        ), // .onTap() replacement
      ],
    );
  }
}
