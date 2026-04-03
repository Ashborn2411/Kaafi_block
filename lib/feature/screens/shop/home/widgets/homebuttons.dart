import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

class HomeFiveButton extends StatelessWidget {
  const HomeFiveButton({super.key, required this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonwithTitle(
            title: 'Wish List',
            color: const Color(0xFFE53935),
            onpressd: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Wishlist(list: controller.data.wishlist),
              ),
            ),
            icon: Icons.favorite_border_rounded,
          ),
          ButtonwithTitle(
            title: 'Categories',
            color: const Color(0xFF03A9F4),
            onpressd: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CategoryScreen()),
            ),
            icon: Icons.category_outlined,
          ),
          ButtonwithTitle(
            title: 'Orders',
            color: const Color(0xFFFF9800),
            onpressd: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Orderlist()),
            ),
            icon: Icons.document_scanner_rounded,
          ),
        ],
      ),
    );
  }
}
