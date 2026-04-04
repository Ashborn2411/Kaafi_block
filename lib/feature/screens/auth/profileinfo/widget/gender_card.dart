import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.ontap,
    required this.iconData,
    required this.istaped,
    required this.gender,
  });

  final VoidCallback ontap;
  final IconData iconData;
  final bool istaped;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: istaped ? 1 : 0.2),
            ),
            height: 70,
            width: 70,
            child: Center(child: Icon(iconData, size: 50)),
          ),
          const SizedBox(height: 4),
          Text(
            gender,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF616161),
            ),
          ),
        ],
      ),
    );
  }
}
