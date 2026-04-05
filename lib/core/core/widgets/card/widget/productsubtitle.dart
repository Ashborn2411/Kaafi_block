
import 'package:flutter/material.dart';


class ProductSubtitle extends StatelessWidget {
  const ProductSubtitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        title,
        style: const TextStyle(fontSize: 14,color: Colors.grey),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}
