import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/relove_nested_scroll_view.dart';
import 'package:relove/data/bottom_navigation_bar_item_data.dart';

import 'package:relove/screens/sell/sell_screen.dart';
import 'package:relove/screens/notifications/notification_screen.dart';
import 'package:relove/screens/profile/profile_screen.dart';
import 'package:relove/screens/home/home_screen_components.dart';
import 'package:relove/relove_firebase/relove_firestore_read.dart';

class Home extends StatefulWidget {
  static const id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentScreenIndex = 0;
  List<Widget>? _screens;
  var _womenClothesData;
  User? _currentUser;

  @override
  void initState() {
    // if (FirebaseAuth.instance.currentUser != null) {
      _currentUser = FirebaseAuth.instance.currentUser;
      print("user(home) : $_currentUser");
      _womenClothesData = getAllWomenClothing();
    // }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    PageController _pageController = PageController();
    _screens = [
      HomeScreenComponents(
        womenClothesData: _womenClothesData!,
      ),
      const SellScreen(),
      const NotificationScreen(),
      const ProfileScreen(),
    ];
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
          children: _screens!,
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
