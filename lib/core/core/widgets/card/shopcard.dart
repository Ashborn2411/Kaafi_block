import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  const ShopCard({
    super.key,
    required this.isnetworkimg,
    this.imgurl = '',
    this.title = '',
    this.subtitle = '',
    this.totalrated = '20k',
    this.rate = 1,
    this.isverified = true,
  });

  final bool isnetworkimg;
  final String imgurl;
  final String title;
  final String subtitle;
  final String totalrated;
  final double rate;
  final bool isverified;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ShopDetails()),
      ),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        padding: const EdgeInsets.all(4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (isnetworkimg)
                  ? Image(image: NetworkImage(imgurl))
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      height: 100,
                      width: 160,
                      child: Image(image: AssetImage(imgurl)),
                    ),
              if (title != '')
                ShoptitlewithVerification(
                  title: title,
                  isverified: isverified,
                  isSemibold: true,
                ),
              if (subtitle != '') ProductSubtitle(title: subtitle),
              if (subtitle != '') const SizedBox(height: 5),
              if (subtitle == '') const Spacer(),
              RatingwithTotalrates(
                rate: rate,
                totalrated: totalrated,
                itemsize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
