
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class RatingwithTotalrates extends StatelessWidget {
  const RatingwithTotalrates({
    super.key,
    required this.rate,
    required this.totalrated,
    this.itemsize = 14,
  });

  final double rate;
  final String totalrated;
  final double itemsize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rate,
          allowHalfRating: true,
          itemSize: itemsize,
          maxRating: 5,
          minRating: 1,
          itemBuilder: (_, index) =>
              const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (double value) {},
        ),
        const SizedBox(width: 5), // 5.widthBox replacement
        Text(
          '($totalrated)',
          style: const TextStyle(
            color: Color(0xFF9E9E9E), // gray500 equivalent
            fontSize: 16, // sm equivalent
          ),
        ),
      ],
    );
  }
}
