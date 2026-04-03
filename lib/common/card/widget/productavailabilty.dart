
import 'package:flutter/material.dart';

class ProductAbleabilty extends StatelessWidget {
  const ProductAbleabilty({super.key, required this.amount});
  final String amount;

  @override
  Widget build(BuildContext context) {
    List<Color> linearcolors = [Colors.red[500]!, Colors.orange[400]!];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: linearcolors),
        borderRadius: BorderRadius.circular(4), // equivalent to .rounded
      ),
      width: double.infinity,
      child: Center(
        child: Text(
          "Only $amount Pcs",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10, // equivalent to .sm.size(8)
          ),
        ),
      ),
    );
  }
}
