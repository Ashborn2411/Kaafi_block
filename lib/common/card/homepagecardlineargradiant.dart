import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class HomePageCardLinearGradiant extends StatelessWidget {
  const HomePageCardLinearGradiant({
    super.key,
    required this.title,
    required this.subtitle,
    this.lineracolor,
    required this.courselist,
  });

  final String title;
  final String subtitle;
  final List<Color>? lineracolor;
  final List<Course>courselist;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: lineracolor!,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8), // equivalent to .rounded
      ),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              ShowAllButton(
                ontap: () {}, // Fixed the onTap callback
              ),
            ],
          ),
          const SizedBox(height: 10), // 10.heightBox replacement
          ProductCardList(autoscroll: false, list:courselist,),
        ],
      ),
    );
  }
}
