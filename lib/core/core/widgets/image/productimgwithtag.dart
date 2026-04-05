import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class ProductimgWithTag extends StatelessWidget {
  const ProductimgWithTag({
    super.key,
    this.isnetworkimg = false,
    this.imgurl = ImageCons.watch1,
    this.tag = true,
    this.itemsold = '10',
    this.height = 200,
    this.width = 220,
  });

  final bool isnetworkimg;
  final String imgurl;
  final bool tag;
  final String itemsold;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundedImg(
          isnetworkimg: isnetworkimg,
          imgurl: imgurl,
          height: height,
          width: width,
        ),
        if (tag)
          Positioned(
            top: 0,
            right: 0,
            child: ProductTag(tag: '$itemsold sold'),
          ),
      ],
    );
  }
}
