
import 'package:flutter/material.dart';


class CODIcon extends StatelessWidget {
  final String title;
  final Color colors ;

  const CODIcon({super.key, this.title='verified', this.colors=Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors, // amber500 equivalent
        borderRadius: BorderRadius.circular(4), // rounded equivalent
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600, // semiBold equivalent
          fontSize: 12, // sm equivalent
        ),
      ),
    );
  }
}
