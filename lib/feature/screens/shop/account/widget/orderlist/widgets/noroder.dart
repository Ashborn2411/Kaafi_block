
import 'package:flutter/material.dart';


class NoOrder extends StatelessWidget {
  const NoOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50), // 50.heightBox replacement
        const Icon(
          Icons.plagiarism_outlined,
          size: 100,
          color: Color(0xFF9E9E9E), // Vx.gray500 replacement
        ),
        Text(
          "No orders found",
          style: TextStyle(
            color: const Color(0xFF757575), // Vx.gray600 replacement
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
