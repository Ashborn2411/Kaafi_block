
import 'package:flutter/material.dart';


class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.title,
    required this.icon,
    required this.ontap,
  });

  final String title;
  final IconData icon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).splashColor,
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Container(padding: EdgeInsets.all(12),decoration: BoxDecoration(color: Colors.purpleAccent,borderRadius:BorderRadius.circular(12)),child: buildRow(),),
      ), // .paddingSymmetric() replacement
    );
  }

  Row buildRow() {
    return Row(
        children: [
          Icon(icon, size: 20,color: Colors.white,),
          const SizedBox(width: 16), // 16.widthBox replacement
          Text(
            title,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white),
          ), // .text.size(16).make() replacement
        ],
      );
  }
}
