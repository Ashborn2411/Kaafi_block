import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    this.title = "EV40DG445OD",
    this.price = "Price",
    this.date = "Date",
  });
  final String title;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4), // roundedSM equivalent
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF424242), // gray800 equivalent
                ),
              ),
              const Orderstatus(),
            ],
          ),
          const SizedBox(height: 10), // 10.heightBox replacement
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF57C00), // orange500 equivalent
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  color: const Color(0xFF757575), // gray600 equivalent
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
