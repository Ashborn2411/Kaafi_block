import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class ShoptitlewithVerification extends StatelessWidget {
  const ShoptitlewithVerification({
    super.key,
    required this.title,
    this.isverified = true,
    this.isSemibold = true,
  });

  final String title;
  final bool isverified;
  final bool isSemibold;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isverified)
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: Stack(
              children: [
                Icon(
                  Icons.shield,
                  size: 12,
                  color: Color(0xFF1E88E5), // Vx.blue600 equivalent
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Icon(Icons.check, size: 8, color: Colors.white),
                ),
              ],
            ),
          ),
        const SizedBox(width: 2), // 2.widthBox replacement
        Shoptitle(title: title, isSemibold: isSemibold),
      ],
    );
  }
}
