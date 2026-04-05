import 'package:flutter/material.dart';

class BannerCarousel extends StatelessWidget {
  final List<String> imagePaths;
  final double borderRadius;
  final double height;

  const BannerCarousel({
    super.key,
    required this.imagePaths,
    this.borderRadius = 12.0,
    this.height = 120,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: PageView.builder(
          controller: PageController(viewportFraction: 1.0),
          itemCount: imagePaths.length,
          itemBuilder: (context, index) {
            return Image.asset(imagePaths[index], fit: BoxFit.cover);
          },
        ),
      ),
    );
  }
}
