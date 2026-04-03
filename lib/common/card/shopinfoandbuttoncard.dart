import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class ShopNameAddressPriceButtons extends StatelessWidget {
  const ShopNameAddressPriceButtons({super.key, required this.instructorName, required this.onPressed, required this.enroll, required this.rate});
  final VoidCallback onPressed,enroll;
  final String instructorName;
  final double rate;

  @override
  Widget build(BuildContext context) {
    final w=MediaQuery.widthOf(context);
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 0.1),
        borderRadius: BorderRadius.circular(4), // roundedSM equivalent
      ),
      padding: const EdgeInsets.all(4), // p4 equivalent
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10), // 10.heightBox replacement
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage(ImageCons.watch1),
                  height: 50,
                  width: 50,
                ),
                Row(

                  children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        instructorName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const CODIcon(title: 'verified', colors: Colors.blueAccent,),
                       RatingwithTotalrates(rate: rate, totalrated: "200"),

                    ],
                  ),
                SizedBox(width: w*.15,),
                  const ProducPriceHorizontl(price: '200', reduced: false),
                ],),

              ],
            ),
            const SizedBox(height: 20), // 20.heightBox replacement
           // const ShopInfo(),
            const Divider(thickness: 0.5),

            const SizedBox(height: 10), // 10.heightBox replacement
            Row(
              children: [
                Flexible(
                  child: SizedBox(
                    height: 40,
                    child: CustomElevatedButton(
                      applyborder: true,
                      title: "Add to cart",
                      textcolor: Colors.black, // Vx.black replacement
                      onPressed: onPressed,
                      backgroundColor: const Color(
                        0xFFEEEEEE,
                      ), // Vx.gray200 replacement
                    ),
                  ),
                ),
                const SizedBox(width: 20), // 20.widthBox replacement
                Flexible(
                  child: SizedBox(
                    height: 40,
                    child: CustomElevatedButton(
                      applyborder: true,
                      backgroundColor: Colors.purple,
                      title: "Enroll",
                      onPressed: enroll,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // 10.heightBox replacement
          ],
        ),
      ),
    );
  }
}
