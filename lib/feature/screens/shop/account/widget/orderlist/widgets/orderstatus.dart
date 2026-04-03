
import 'package:flutter/material.dart';


class Orderstatus extends StatelessWidget {
  const Orderstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFC62828), // red700 equivalent
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4),
              bottomLeft: Radius.circular(4),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            "Canceled",
            style: TextStyle(
              fontWeight: FontWeight.w600, // semiBold equivalent
              color: Colors.white,
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF57C00), // orange500 equivalent
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Text(
            "COD",
            style: TextStyle(
              fontWeight: FontWeight.w600, // semiBold equivalent
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
