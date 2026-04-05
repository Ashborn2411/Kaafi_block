import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatelessWidget {
  const HomePageCard({
    super.key,
    this.title = '',
    this.subtitle = '',
    this.onTap,
    this.color = Colors.white,
    this.textcolor = Colors.black,
    this.autoscroll = false,
    this.showall = true,
    this.applyrating = false,
    this.isSemibold = false,
    required this.courseList,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color color;
  final Color textcolor;
  final bool autoscroll;
  final bool showall;
  final bool applyrating;
  final bool isSemibold;
  final List<Course> courseList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textcolor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              if (showall) ShowAllButton(ontap: onTap),
            ],
          ),
          const SizedBox(height: 10),
          ProductCardList(
            autoscroll: autoscroll,
            isSemibold: isSemibold,
            applyrating: applyrating,
            list: courseList,
          ),
        ],
      ),
    );
  }
}

class ProductCardList extends StatelessWidget {
  const ProductCardList({
    super.key,
    this.autoscroll =
        false, // Kept for API compatibility but autoscroll removed
    this.isSemibold = false,
    this.applyrating = false,
    required this.list,
  });

  final bool autoscroll;
  final bool isSemibold;
  final bool applyrating;
  final List<Course> list;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SizedBox(
      height: h * .26,
      child: ListView.separated(
        shrinkWrap: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        scrollDirection: Axis.horizontal,
        cacheExtent: 10,
        itemBuilder: (context, index) => ProductCard(
          title: list[index].title,
          subtitle: list[index].instructorName,
          amount: list[index].price.toString(),
          price: list[index].price.toString(),
          imgurl: list[index].thumbnail,
          isnetworkimg: true,
          id: list[index].courseId,
          list: list,
          applyrating: applyrating,
          isSemibold: isSemibold,
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemCount: list.length,
      ),
    );
  }
}
