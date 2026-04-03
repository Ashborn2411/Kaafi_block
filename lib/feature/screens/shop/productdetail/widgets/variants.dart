
import 'package:flutter/material.dart';


class Variants extends StatelessWidget {
  const Variants({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10); // 10.widthBox replacement
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0), // gray300 equivalent
              borderRadius: BorderRadius.circular(4), // roundedSM equivalent
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                child: Text(
                  "Title",
                  style: TextStyle(
                    color: const Color(0xFF757575), // gray600 equivalent
                    fontWeight: FontWeight.w600, // semiBold equivalent
                    fontSize: 14,
                  ),
                ), // .text.gray600.semiBold.size(14).make() replacement
              ), // .paddingSymmetric() replacement
            ), // .centered() replacement
          ); // .box.roundedSM.gray300.make() replacement
        },
      ),
    );
  }
}
