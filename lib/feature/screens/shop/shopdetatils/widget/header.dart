import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key, required this.sort, required this.filter});

  final VoidCallback sort;
  final VoidCallback filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5), // gray100 equivalent
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Products",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ), // .text.bold.size(18).make().paddingSymmetric() replacement
          ),
          const Spacer(),
          Customimageicon(
            ontap: sort, // Fixed: use the provided sort callback
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomIconButton(
              icon: Icons.filter_alt,
              onPressed: filter, // Fixed: use the provided filter callback
              iconColor: Colors.black, // Vx.black replacement
              backgroundColor: Colors.white, // Vx.white replacement
            ),
          ), // .paddingSymmetric() replacement
        ],
      ),
    ); // .box.gray100.padding().make() replacement
  }
}
