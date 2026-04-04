import 'longpressfab/view/view.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen(this.pages, {super.key});
  final List<Widget> pages;
  static final List<Widget> _pages = [];

  static const List<IconData> _navIcons = [
    Iconsax.home_15,
    Icons.check_circle,
    Iconsax.task_square5,
    Iconsax.profile_2user5,
  ];

  static const List<String> _labels = [
    'Home',
    'Attendance',
    'Tasks',
    'Profile',
  ];

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar: isLargeScreen
          ? AppBar(
              title: const Text('Work Manager'),
              centerTitle: true,
              elevation: 0,
            )
          : AppBar(
              title: Text(NavigationScreen._labels[_selectedIndex]),
              centerTitle: true,
              elevation: 0,
            ),
      body: isLargeScreen
          ? Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: _changeIndex,
                  labelType: NavigationRailLabelType.all,
                  destinations: List.generate(NavigationScreen._labels.length, (
                    index,
                  ) {
                    return NavigationRailDestination(
                      icon: Icon(NavigationScreen._navIcons[index]),
                      selectedIcon: Icon(
                        NavigationScreen._navIcons[index],
                        color: Colors.grey[800],
                      ),
                      label: Text(NavigationScreen._labels[index]),
                    );
                  }),
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: _changeIndex,
                    children: NavigationScreen._pages,
                  ),
                ),
              ],
            )
          : PageView(
              controller: _pageController,
              onPageChanged: _changeIndex,
              children: NavigationScreen._pages,
            ),
      floatingActionButton: !isLargeScreen && _selectedIndex == 0
          ? const LongPressFAB()
          : null,
      bottomNavigationBar: isLargeScreen
          ? null
          : BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _changeIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.grey[800],
              unselectedItemColor: Colors.grey[500],
              items: List.generate(NavigationScreen._labels.length, (index) {
                return BottomNavigationBarItem(
                  icon: Icon(NavigationScreen._navIcons[index]),
                  label: NavigationScreen._labels[index],
                );
              }),
            ),
      drawer: isLargeScreen
          ? null
          : Drawer(
              child: ListView.builder(
                itemCount: NavigationScreen._labels.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(NavigationScreen._navIcons[index]),
                    title: Text(NavigationScreen._labels[index]),
                    selected: _selectedIndex == index,
                    onTap: () {
                      _changeIndex(index);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
    );
  }
}
