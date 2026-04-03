import '/exports/data_paths.dart';

import 'package:flutter/material.dart';


class PagesLoader extends StatefulWidget {
  final List<String> dotlottieAssets;
  final List<String> titles;
  final TextStyle textStyle;
  const PagesLoader({super.key, required this.dotlottieAssets, required this.titles, required this.textStyle});

  @override
  State<PagesLoader> createState() => _PagesLoaderState();
}

class _PagesLoaderState extends State<PagesLoader> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assetpaths = widget.dotlottieAssets;
    final titlepaths = widget.titles;
    return PageView(
      controller: _pageController,
      children: [
        for (int i = 0; i < assetpaths.length; i++)
          IntoScreen(
            imagepath: assetpaths[i],
            title: titlepaths[i],
            textStyle: widget.textStyle,
            value: (i == assetpaths.length - 1),
            pageController: _pageController,
          ),
      ],
    );
  }
}
