import '/exports/data_paths.dart';

import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabScreens = [
      const CategoriesDetails(),
      const Center(child: Text('Screen 2')),
      const Center(child: Text('Screen 3')),
      const Center(child: Text('Screen 4')),
      const Center(child: Text('Screen 5')),
      const Center(child: Text('Screen 6')),
      const Center(child: Text('Screen 7')),
      const Center(child: Text('Screen 8')),
      const Center(child: Text('Screen 9')),
      const Center(child: Text('Screen 10')),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  final bool isSelected = index == selectedIndex;
                  return GestureDetector(
                    onTap: () => setState(() => selectedIndex = index),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        children: [
                          AnimatedContainer(
                            clipBehavior: Clip.hardEdge,
                            curve: Curves.linear,
                            duration: const Duration(milliseconds: 300),
                            height: isSelected ? 120 : 0,
                            width: 5,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 500),
                              height: 120,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 0,
                              ),
                              child: const ImgWithTitle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: tabScreens[selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
