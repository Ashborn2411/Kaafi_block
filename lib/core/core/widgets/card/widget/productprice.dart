
import 'package:flutter/material.dart';


class ProducPrice extends StatelessWidget {
  const ProducPrice({
    super.key,
    this.reduced = true,
    required this.price,
    this.newprice,
  });
  final bool reduced;
  final String price;
  final String? newprice;

  @override
  Widget build(BuildContext context) {
    return (!reduced)
        ? Text(
            "৳ $price",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFFF57C00), // orange600 equivalent
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "৳ $price",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 10, // sm size equivalent
                  fontWeight: FontWeight.w600, // semiBold equivalent
                  color: Color(0xFF9E9E9E), // gray500 equivalent
                ),
              ),
              Text(
                "৳ $newprice",
                style: const TextStyle(
                  fontWeight: FontWeight.w600, // semiBold equivalent
                  fontSize: 14, // medium size equivalent
                  color: Color(0xFFF57C00), // orange600 equivalent
                ),
              ),
            ],
          );
  }
}

class ProducPriceHorizontl extends StatelessWidget {
  const ProducPriceHorizontl({
    super.key,
    this.reduced = true,
    required this.price,
    this.newprice,
  });
  final bool reduced;
  final String price;
  final String? newprice;

  @override
  Widget build(BuildContext context) {
    return (!reduced)
        ? Text(
            "Price ৳ $price",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color(0xFFB436D6), // orange600 equivalent
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "৳ $price",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Color(0xFF9E9E9E), // gray500 equivalent
                ),
              ),
              const SizedBox(width: 4), // Add some spacing between prices
              Text(
                "৳ $newprice",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF57C00), // orange600 equivalent
                ),
              ),
            ],
          );
  }
}
