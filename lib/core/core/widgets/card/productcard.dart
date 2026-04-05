import '/exports/data_paths.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.price,
    this.newprice,
    required this.imgurl,
    required this.isnetworkimg,
    this.isSemibold = true,
    this.reduced = false,
    this.isverified = true,
    this.applyrating = false,
    required this.id,
    required this.list,
  });

  final String title;
  final String id;
  final String subtitle;
  final String amount;
  final String price;
  final String? newprice;
  final String imgurl;
  final bool isnetworkimg;
  final bool reduced;
  final bool isverified;
  final bool isSemibold;
  final bool applyrating;
  final List<Course> list;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProductDetails(id: id)),
      ),
      child: Container(
        width: w * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            (isnetworkimg)
                ? Image(
                    image: NetworkImage(imgurl),
                    fit: BoxFit.cover,
                    height: 120,
                    width: 200,
                  )
                : Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    height: 100,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage(imgurl),
                      height: 120,
                      width: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProducttitlewithVerification(
                    title: title,
                    isverified: isverified,
                    isSemibold: isSemibold,
                  ),
                  ProductSubtitle(title: subtitle),
                  const SizedBox(height: 1),
                  ProducPrice(
                    price: price,
                    newprice: newprice,
                    reduced: reduced,
                  ),
                  const SizedBox(height: 2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text(
                            "Buy Now",
                            style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
