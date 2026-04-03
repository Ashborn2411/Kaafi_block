import 'package:flutter/material.dart';

class CampaignTitlebox extends StatelessWidget {
  final bool isSelected;
  final int index;
  final String title;
  final VoidCallback onTap;

  const CampaignTitlebox({
    super.key,
    required this.isSelected,
    required this.index,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: isSelected
              ? const Border(bottom: BorderSide(color: Colors.black, width: 2))
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isSelected ? Colors.black : const Color(0xFFBDBDBD),
          ),
        ),
      ),
    );
  }
}
