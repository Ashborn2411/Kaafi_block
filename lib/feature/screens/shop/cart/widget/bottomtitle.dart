import '/exports/data_paths.dart';

import 'package:flutter/material.dart';




class BottomTitle extends StatelessWidget {
  const BottomTitle({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 20.0,
      shadowColor: Colors.black, // Vx.black replacement
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Vx.white replacement
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8), // topRounded equivalent
            topRight: Radius.circular(8), // topRounded equivalent
          ),
        ),
        padding: const EdgeInsets.all(16), // p16 equivalent
        child: Title(
          color: Colors.white, // Vx.white replacement
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.circle_outlined, size: 20),
                  ), // .onTap replacement
                  const SizedBox(width: 4), // 4.widthBox replacement
                  Text(
                    "All",
                    style: TextStyle(fontSize: 16),
                  ), // .text.size(16).make() replacement
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600, // semiBold equivalent
                    ),
                  ), // .text.size(16).semiBold.make() replacement
                  Text(
                    "\$$value",
                    style: TextStyle(
                      fontWeight: FontWeight.w600, // semiBold equivalent
                      color: const Color(0xFFF57C00), // orange500 equivalent
                      fontSize: 16,
                    ),
                  ), // .text.semiBold.orange500.size(16).make() replacement
                  const SizedBox(width: 10), // 10.widthBox replacement
                  SizedBox(
                    width: 120,
                    height: 40,
                    child: CustomElevatedButton(
                      title: "Check out",
                      onPressed: () {},
                    ),
                  ), // .box.width(120).height(40).make() replacement
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
