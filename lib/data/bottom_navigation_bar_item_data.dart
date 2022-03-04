import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

// import 'package:relove/screens/sell/sell_screen.dart';
// import 'package:relove/screens/notifications/notification_screen.dart';
// import 'package:relove/screens/profile/profile_screen.dart';
// import 'package:relove/screens/home/home_screen_components.dart';

class BottomNavigationBarData {

  static final List<BottomNavigationBarItem> bottomNavigationBarItemList = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      backgroundColor: kPrimaryColor,
      icon: SvgPicture.asset(
        "assets/bottom_navigation_bar/home_unselected.svg",
      ),
      activeIcon: SvgPicture.asset(
        "assets/bottom_navigation_bar/home_selected.svg",
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      backgroundColor: kPrimaryColor,
      icon: SvgPicture.asset(
        "assets/bottom_navigation_bar/sell_unselected.svg",
      ),
      activeIcon: SvgPicture.asset(
        "assets/bottom_navigation_bar/sell_selected.svg",
      ),
      label: 'Sell',
    ),
    BottomNavigationBarItem(
      backgroundColor: kPrimaryColor,
      icon: SvgPicture.asset(
        "assets/bottom_navigation_bar/notification_unselected.svg",
      ),
      activeIcon: SvgPicture.asset(
        "assets/bottom_navigation_bar/notification_selected.svg",
      ),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      backgroundColor: kPrimaryColor,
      icon: SvgPicture.asset(
        "assets/bottom_navigation_bar/profile_unselected.svg",
      ),
      activeIcon: SvgPicture.asset(
        "assets/bottom_navigation_bar/profile_selected.svg",
      ),
      label: 'Profile',
    ),
  ];

  // static final screens = [
  //   const HomeScreenComponents(),
  //   const SellScreen(),
  //   const NotificationScreen(),
  //   const ProfileScreen(),
  // ];

}

