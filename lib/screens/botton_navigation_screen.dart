import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:trademaza/views/trending_screen.dart';
import 'package:trademaza/widgets/appbar.dart';

import '../views/explore.dart';
import '../views/home_screen.dart';
import '../views/trips.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 0,
      keepPage: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  List<BottomNavigationBarItem> navBarItem = [
    const BottomNavigationBarItem(
      label: "Home ",
      icon: Icon(
        Iconsax.home,
        // color: 0 == selectedItem ? Colors.white : Colors.black,
        size: 20,
      ),
    ),
    const BottomNavigationBarItem(
      label: "Trending ",
      icon: Icon(
        Icons.fireplace_outlined,
        size: 20,
      ),
    ),
    const BottomNavigationBarItem(
      label: "Groups ",
      icon: Icon(
        Icons.group_add_rounded,
        size: 20,
      ),
    ),
    const BottomNavigationBarItem(
      label: "NewsFeed ",
      icon: Icon(
        Icons.newspaper,
        size: 20,
      ),
    )
  ];

  PageController _pageController = PageController();

  int selectedIndex = 0;
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: custoAppBar(context),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          allowImplicitScrolling: true,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: const [
            HomeScreen(),
            TrendingScreen(),
            Trips(),
            SizedBox(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          iconSize: 20,
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          enableFeedback: true,
          elevation: 3,
          useLegacyColorScheme: true,
          showSelectedLabels: true,
          onTap: (value) {
            selectedIndex = value;

            _pageController.animateToPage(
                curve: Curves.linear,
                duration: const Duration(milliseconds: 200),
                selectedIndex);
          },
          items: navBarItem,
        ));
  }
}

/**BottomAppBar(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0, left: 15),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  _pageController!.jumpToPage(_pageController!.initialPage);
                  setState(() {
                    navigationTapped(0);
                  });
                  selectItem(0);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 0 == selectedItem ? Colors.red : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.home,
                      color: 0 == selectedItem ? Colors.white : Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(1);
                  });
                  selectItem(1);
                  print(_page);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 1 == selectedItem ? Colors.red : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Ionicons.compass_outline,
                      color: 1 == selectedItem ? Colors.white : Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(2);
                  });
                  selectItem(2);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 2 == selectedItem ? Colors.red : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Iconsax.menu_board,
                      color: 2 == selectedItem ? Colors.white : Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: () => print('Add Story'),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                    child: const Center(
                      child: Icon(
                        Ionicons.add,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
 */
