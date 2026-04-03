import '/exports/data_paths.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';



class CardLogoBaner extends StatelessWidget {
  const CardLogoBaner({
    super.key,
    this.companylog = ImageCons.watch1,
    this.banner = ImageCons.banner1,
    required this.title,
    this.ratings = 5,
    this.totalrated = "20",
    this.isnetworkimg = false,
  });
  final String companylog;
  final String banner;
  final String title;
  final double ratings;
  final String totalrated;
  final bool isnetworkimg;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 0.2),
            borderRadius: BorderRadius.circular(4), // roundedSM equivalent
          ),
          height: 260,
          child: Stack(
            children: [
              TopLeftRightroundedimg(banner: banner),
              Positioned(
                top: 100,
                left: 20,
                child: Row(
                  children: [
                    CardWithAttribute(
                      imgurl: companylog,
                      isnetworkimg: isnetworkimg,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 100,
                top: 150,
                child: Container(
                  width: 300,
                  color: Colors.white,
                  child: Column(
                    children: [
                      MultilineTitlewithverification(title: title),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: RatingwithTotalrates(
                          rate: ratings,
                          totalrated: totalrated,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 200,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.location_pin, size: 10),
                            const SizedBox(width: 4), // 4.widthBox replacement
                            Text(
                              "Pallabi,Dhaka",
                              style: TextStyle(
                                color: Colors.grey[800], // gray800 equivalent
                                fontSize: 12, // sm equivalent
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3), // 3.heightBox replacement
                        Row(
                          children: [
                            const Icon(Iconsax.truck_time, size: 10),
                            const SizedBox(width: 4), // 4.widthBox replacement
                            Row(
                              children: [
                                Text(
                                  "Delivery in",
                                  style: TextStyle(
                                    color:
                                        Colors.grey[800], // gray800 equivalent
                                    fontSize: 12, // sm equivalent
                                  ),
                                ),
                                Text(
                                  " 1 to 4 Days",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Colors.grey[700], // gray700 equivalent
                                    fontSize: 12, // sm equivalent
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MultilineTitlewithverification extends StatelessWidget {
  const MultilineTitlewithverification({
    super.key,
    required this.title,
    this.size = 15,
    this.isboled = true,
  });

  final String title;
  final double size;
  final bool isboled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 4, top: 5),
              child: Stack(
                children: [
                  Icon(
                    Icons.shield,
                    size: 13,
                    color: Color(0xFF1E88E5), // Vx.blue600 equivalent
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Icon(Icons.check, size: 10, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 3), // 3.widthBox replacement
            Flexible(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: isboled
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: size,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
