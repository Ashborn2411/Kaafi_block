import '/exports/data_paths.dart';

import 'package:flutter/material.dart';



class DispatchedScreen extends StatelessWidget {
  const DispatchedScreen({super.key, this.noitem = true});
  final bool noitem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Vx.gray100 replacement
      body: (noitem)
          ? SingleChildScrollView(
              child: ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return const OrderCard();
                },
              ),
            )
          : const NoOrder(),
    );
  }
}
