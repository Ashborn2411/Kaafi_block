import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class ImgWithTitle extends StatelessWidget {
  const ImgWithTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5), // gray100 equivalent
            borderRadius: BorderRadius.circular(4), // roundedSM equivalent
          ),
          child: const Image(
            image: AssetImage(ImageCons.watch1),
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
        ), // .box.gray100.roundedSM.make() replacement
        Expanded(
          child: Text(
            "Title",
            textAlign: TextAlign.center, // .center equivalent
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ), // .text.maxLines(2).center.make() replacement
        ),
      ],
    );
  }
}
