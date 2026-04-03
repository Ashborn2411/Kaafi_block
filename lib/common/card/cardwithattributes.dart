import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class CardWithAttribute extends StatelessWidget {
  const CardWithAttribute({
    super.key,
    this.imgurl = ImageCons.watch1,
    this.isnetworkimg = false,
  });
  final String imgurl;
  final bool isnetworkimg;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4), // roundedSM equivalent
      ),
      padding: const EdgeInsets.all(4), // p4 equivalent
      child: Column(
        children: [
          RoundedImg(
            isnetworkimg: isnetworkimg,
            imgurl: imgurl,
            height: 60,
            width: 60,
          ),
          const SizedBox(height: 5), // 5.heightBox replacement
          const CODIcon(),
        ],
      ),
    );
  }
}
