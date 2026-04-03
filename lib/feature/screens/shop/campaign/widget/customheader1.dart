import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

class CustomHeader1 extends StatefulWidget {
  final VoidCallback sort;
  final VoidCallback filter;

  const CustomHeader1({super.key, required this.sort, required this.filter});

  @override
  State<CustomHeader1> createState() => _CustomHeader1State();
}

class _CustomHeader1State extends State<CustomHeader1> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> boxtitle = ['Products', 'Shops'];

    return Container(
      color: Colors.white,
      height: 45,
      child: Row(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: boxtitle.length,
              itemBuilder: (BuildContext context, int index) {
                return CampaignTitlebox(
                  title: boxtitle[index],
                  index: index,
                  isSelected: selectedIndex == index,
                  onTap: () => setState(() => selectedIndex = index),
                );
              },
            ),
          ),
          const Spacer(),
          if (selectedIndex == 0)
            Container(
              height: 50,
              padding: const EdgeInsets.only(right: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Customimageicon(
                      size: 20,
                      ontap: widget.sort,
                      bgcolor: const Color(0xFFEEEEEE),
                    ),
                  ),
                  CustomIconButton(
                    icon: Icons.filter_alt,
                    onPressed: widget.filter,
                    size: 20,
                    minimumSize: const Size(20, 20),
                    iconColor: Colors.black,
                    backgroundColor: const Color(0xFFEEEEEE),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
