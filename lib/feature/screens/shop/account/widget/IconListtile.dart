import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class IconListTitle extends StatelessWidget {
  const IconListTitle({
    super.key,
    this.icon = Icons.person_add_outlined,
    required this.ontap,
    this.title = "Old Accounts & Orders",
    required this.color,
  });
  final IconData icon;
  final VoidCallback ontap;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: CustomIconButton(
        icon: icon,
        backgroundColor: color,
        onPressed: () {},
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
    );
  }
}
