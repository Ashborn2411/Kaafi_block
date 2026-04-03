import '/exports/data_paths.dart';

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntoScreen extends StatelessWidget {
  final String imagepath;
  final String title;
  final TextStyle textStyle;
  final bool value;
  final PageController pageController;
  const IntoScreen({
    super.key,
    required this.imagepath,
    required this.title,
    required this.textStyle,
    required this.value,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    final String imgpath = imagepath;
    final String ttl = title;
    final height = MediaQuery.heightOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: (value)
          ? FloatingActionButton(
              focusColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tooltip: "Click here to go login page",
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              ),
              child: Icon(Icons.arrow_forward),
            )
          : FloatingActionButton(
              focusColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              tooltip: "Swipe to see next page",
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurpleAccent,
              onPressed: () {
                pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Icon(Icons.arrow_forward),
            ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.45,
              child: buildDotLottieLoader(imgpath),
            ),
            SizedBox(height: height * 0.1),
            Text(ttl, style: textStyle),
          ],
        ),
      ),
    );
  }

  DotLottieLoader buildDotLottieLoader(String imgpath) {
    return DotLottieLoader.fromAsset(
      imgpath,
      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
        if (dotlottie != null) {
          return Lottie.memory(dotlottie.animations.values.single);
        } else {
          return Container();
        }
      },
      errorBuilder: (ctx, ob, e) {
        if (kDebugMode) {
          print(e.toString());
        }
        return Image.asset(Assetspaths.wrong, fit: BoxFit.fill);
      },
    );
  }
}
