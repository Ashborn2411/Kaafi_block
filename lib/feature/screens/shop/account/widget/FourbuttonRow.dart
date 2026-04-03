import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

class FourButtonRow extends StatelessWidget {
  const FourButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonwithTitle(
          title: 'Address',
          color: const Color(0xFFFB8C00),
          onpressd: () {},
          icon: Icons.location_pin,
        ),
        const SizedBox(width: 50),
        ButtonwithTitle(
          title: 'Message',
          color: const Color(0xFFFFEB3B),
          onpressd: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Ai_Chat()),
          ),
          icon: Icons.message,
        ),
      ],
    );
  }
}
