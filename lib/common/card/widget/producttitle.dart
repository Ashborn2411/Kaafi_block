
import 'package:flutter/material.dart';


class Producttitle extends StatelessWidget {
  const Producttitle({
    super.key,
    required this.title,
    this.isSemibold = true,
    this.iselipsis = true,
  });
  final String title;
  final bool isSemibold;
  final bool iselipsis;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSemibold ? FontWeight.w600 : FontWeight.normal,
          fontSize: 14,
          color: Colors.black,
        ),
        overflow: iselipsis ? TextOverflow.ellipsis : TextOverflow.visible,
      ),
    );
  }
}

class Shoptitle extends StatelessWidget {
  const Shoptitle({
    super.key,
    required this.title,
    this.isSemibold = true,
    this.iselipsis = true,
  });
  final String title;
  final bool isSemibold;
  final bool iselipsis;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSemibold ? FontWeight.w500 : FontWeight.normal,
          fontSize: 16,
        ),
        overflow: iselipsis ? TextOverflow.ellipsis : TextOverflow.visible,
      ),
    );
  }
}
