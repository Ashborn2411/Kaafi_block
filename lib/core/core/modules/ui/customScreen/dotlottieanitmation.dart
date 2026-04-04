import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomAnimationScreen1 extends StatelessWidget {
  const CustomAnimationScreen1(
      {super.key, required this.asset, required this.detail});
  final String asset;
  final String detail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SizedBox(
                width: double.infinity,
                child: DotLottieLoader.fromAsset(asset,
                    frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                  if (dotlottie != null) {
                    return Lottie.memory(dotlottie.animations.values.single);
                  } else {
                    return Container();
                  }
                }),
              ),
            ),
            Text(
              detail,
              style: TextStyle(color: Colors.grey[400]),
            ),
            const SizedBox(height: 8),
            const SizedBox(
              width: 120,
              child: LinearProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
