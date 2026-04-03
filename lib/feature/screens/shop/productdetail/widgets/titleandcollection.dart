
import 'package:flutter/material.dart';


class TileandCollections extends StatelessWidget {
  const TileandCollections({
    super.key,
    this.title = 'Gas Stoves',
    required this.titleontap,
    required this.individualontap,
  });

  final String title;
  final VoidCallback titleontap;
  final VoidCallback individualontap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: titleontap,
          child: Text(
            title,
            style: TextStyle(
              color: const Color(0xFF42A5F5), // Vx.blue400 replacement
              fontWeight: FontWeight.w600, // semiBold equivalent
            ),
          ), // .text.color().semiBold.make().onTap() replacement
        ),
        const SizedBox(width: 5), // 5.widthBox replacement
        Center(
          child: Container(
            width: 4,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.blue[500],
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 5), // 5.widthBox replacement
        GestureDetector(
          onTap: individualontap,
          child: Text(
            "Individual Collection",
            style: TextStyle(
              color: const Color(0xFF42A5F5), // Vx.blue400 replacement
              fontWeight: FontWeight.w600, // semiBold equivalent
            ),
          ), // .text.color().semiBold.make().onTap() replacement
        ),
      ],
    );
  }
}
