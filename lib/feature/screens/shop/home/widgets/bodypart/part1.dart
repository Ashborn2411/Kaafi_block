import '/exports/data_paths.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class Part1 extends StatelessWidget {
  const Part1({super.key, required this.list});
  final List<Course>list;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //const HomeFiveButton(),
        Text(
          "Learning that fits",
          style: GoogleFonts.merriweather(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 20),
        HomeBannerCard(list:list),
        const SizedBox(height: 10), // 10.heightBox replacement
         HomePageCardLinearGradiant(
          title: 'Learn more, spend less',
          subtitle: 'save upto 70% on selected courses',
          lineracolor: [Color.fromARGB(255, 213, 195, 225), Color.fromARGB(255, 170, 235, 226)],
           courselist:list,
        ),
        const SizedBox(height: 10), // 10.heightBox replacement
        const HomePageCard(
          title: 'Trending Courses',
          subtitle: 'Top trending courses this week',
          color: Color(0xFFFFEBEE), // Vx.red100 replacement
        ),
        const SizedBox(height: 10), // 10.heightBox replacement
        const HomePageCard(
          applyrating: true,
          title: 'Popular Courses',
          subtitle: 'Courses You May Like',
          color: Color(0xFFF3E5F5), // Vx.purple100 replacement
        ),
      ],
    );
  }
}
