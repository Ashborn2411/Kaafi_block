import 'package:flutter/material.dart';
import '/exports/data_paths.dart';

class ShopCardlistTitle extends StatelessWidget {
  const ShopCardlistTitle({
    super.key,
    this.title = 'Top Rated Shops',
    this.subtitle = 'Loved by Customers Like You',
    this.color = const Color(0xFF8E24AA),
    this.autoscroll = false,
    required this.ontap,
    required this.list,
  });
  final String title;
  final String subtitle;
  final Color color;
  final bool autoscroll;
  final VoidCallback ontap;
  final List<Course> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: TitleSubtitleandButton(
              title: title,
              subtitle: subtitle,
              ontap: ontap,
              color: color,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ShopCardList(
              autoscroll: autoscroll,
              list: list,
            ),
          ),
        ],
      ),
    );
  }
}
