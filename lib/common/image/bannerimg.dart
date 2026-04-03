
import 'package:flutter/material.dart';


class TopLeftRightroundedimg extends StatelessWidget {
  const TopLeftRightroundedimg({
    super.key,
    required this.banner,
  });
  final String banner;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Image.asset(
        banner,
        width: double.infinity,
        height: 140,
        fit: BoxFit.fill,
      ),
    );
  }
}
