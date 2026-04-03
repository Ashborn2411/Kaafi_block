import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class CategoriesDetails extends StatelessWidget {
  const CategoriesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10); // 10.heightBox replacement
      },
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(
                "Tile",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ), // .text.size(18).bold.make().paddingOnly() replacement
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const ImgWithTitle();
              },
            ),
          ],
        );
      },
    );
  }
}
