import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Customshimmer extends StatelessWidget {
  const Customshimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
