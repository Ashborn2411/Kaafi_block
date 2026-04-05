import 'package:flutter/material.dart';
import '/exports/data_paths.dart';

class ProductCardWithTag extends StatelessWidget {
  const ProductCardWithTag({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.enrolled,
    required this.rating,
    required this.url,
  });

  final String id;
  final String title;
  final String price;
  final String enrolled;
  final double rating;
  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetails(id: id),
          fullscreenDialog: true,
        ),
      ),
      child: Container(
        width: 220.0,
        height: 400.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductimgWithTag(
              height: 200,
              width: 220,
              itemsold: enrolled,
              isnetworkimg: true,
              imgurl: url,
            ),
            const SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MultilineTitlewithverification(
                title: title,
                size: 16.0,
                isboled: true,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ProducPrice(
                price: '5000',
                reduced: true,
                newprice: price,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 5.0),
                  RatingwithTotalrates(rate: rating, totalrated: '20'),
                ],
              ),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
