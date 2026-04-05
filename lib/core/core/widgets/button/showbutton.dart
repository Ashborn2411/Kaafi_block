
import 'package:flutter/material.dart';

class ShowAllButton extends StatelessWidget {
  const ShowAllButton({super.key, this.ontap});
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4), // equivalent to .rounded
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: [
            Text(
              "Show All",
              style: TextStyle(
                fontSize: 14, // equivalent to .sm
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 12),
          ],
        ),
      ),
    );
  }
}
