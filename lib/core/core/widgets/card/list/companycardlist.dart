import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

class ShopCardList extends StatelessWidget {
  const ShopCardList({
    super.key,
    this.autoscroll =
        false, // Removed auto-scroll functionality to make stateless
    this.isSemibold = false,
    this.applyrating = false,
    required this.list,
  });

  final bool autoscroll; // Kept for API compatibility but not used
  final bool isSemibold;
  final bool applyrating;
  final List<Course> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: ListView.separated(
        shrinkWrap: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        cacheExtent: 5,
        itemBuilder: (context, index) => ShopCard(
          isnetworkimg: true,
          imgurl: list[index].thumbnail,
          title: list[index].title,
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: list.length,
      ),
    );
  }
}
