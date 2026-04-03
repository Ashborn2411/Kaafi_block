import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class Part2 extends StatelessWidget {
  const Part2({super.key, required this.list});
  final List<Course> list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShopCardlistTitle(
              title: 'Top rated courses',
              ontap: () {},
              list: list,
            ),
            ShopCardlistTitle(
              title: 'Life skills courses',
              subtitle: 'You might need',
              color: const Color(0xFFF57C00),
              ontap: () {},
              list: list,
            ),
            ShopCardlistTitle(
              title: 'Engineering courses',
              subtitle: 'Exclusive Deals for You',
              color: const Color(0xFF10B981),
              ontap: () {},
              list: list,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Recently Added",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 300,
              ),
              itemCount: list.length > 10 ? 10 : list.length,
              itemBuilder: (BuildContext context, int index) {
                final course = list[index];
                return ProductCardWithTag(
                  id: course.courseId,
                  title: course.title,
                  price: course.price.toString(),
                  enrolled: course.enrolled.toString(),
                  rating: course.rating,
                  url: course.thumbnail,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
