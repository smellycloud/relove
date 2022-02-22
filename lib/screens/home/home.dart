import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/ReloveNestedScrollView.dart';
import 'package:relove/data/bottom_navigation_bar_item_data.dart';

class Home extends StatefulWidget {
  static const id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        iconSize: 24.0,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: _currentScreenIndex,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _currentScreenIndex = index;
            _pageController.animateToPage(_currentScreenIndex,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        },
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        items: BottomNavigationBarData.bottomNavigationBarItemList,
      ),
      backgroundColor: Colors.white,
      body: ReloveNestedScrollView(
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: BottomNavigationBarData.screens,
          onPageChanged: (index) {
            setState(() {
              _currentScreenIndex = index;
            });
          },
        ),
      ),
    );
  }
}
