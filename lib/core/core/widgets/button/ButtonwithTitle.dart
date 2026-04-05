import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class ButtonwithTitle extends StatelessWidget {
  const ButtonwithTitle({
    super.key,
    required this.title,
    required this.color,
    required this.onpressd,
    required this.icon,
  });
  final String title;
  final Color color;
  final VoidCallback onpressd;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(
          minimumSize: const Size(50, 50),
          size: 24,
          iconColor: color,
          icon: icon,
          onPressed: onpressd,
        ),
        Text(
          title,
          style: TextStyle(
            color: const Color(0xFF9E9E9E), // gray500 equivalent
            fontSize: 12, // sm equivalent
          ),
        ),
      ],
    );
  }
}

