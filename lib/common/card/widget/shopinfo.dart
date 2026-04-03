
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ShopInfo extends StatelessWidget {
  const ShopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.location_pin, size: 10),
            const SizedBox(width: 4), // 4.widthBox replacement
            Text(
              "Pallabi,Dhaka",
              style: TextStyle(
                color: Colors.grey[700], // gray600 equivalent
                fontSize: 12, // sm equivalent
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Iconsax.truck, size: 10),
            const SizedBox(width: 4), // 4.widthBox replacement
            Row(
              children: [
                Text(
                  "৳ 60",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800], // gray700 equivalent
                    fontSize: 12, // sm equivalent
                  ),
                ),
                Text(
                  " (৳ 120 Outside Area)",
                  style: TextStyle(
                    color: Colors.grey[700], // gray600 equivalent
                    fontSize: 12, // sm equivalent
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Iconsax.truck_time, size: 10),
            const SizedBox(width: 4), // 4.widthBox replacement
            Row(
              children: [
                Text(
                  "Delivery in",
                  style: TextStyle(
                    color: Colors.grey[700], // gray600 equivalent
                    fontSize: 12, // sm equivalent
                  ),
                ),
                Text(
                  " 1 to 4 Days",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800], // gray700 equivalent
                    fontSize: 12, // sm equivalent
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.shopping_bag_outlined, size: 10),
            const SizedBox(width: 4), // 4.widthBox replacement
            Row(
              children: [
                Text(
                  "Stock: ",
                  style: TextStyle(
                    color: Colors.grey[700], // gray600 equivalent
                    fontSize: 12, // sm equivalent
                  ),
                ),
                Text(
                  "500",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800], // gray700 equivalent
                    fontSize: 12, // sm equivalent
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
