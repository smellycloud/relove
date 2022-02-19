import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/home/CategoryBubble.dart';
import 'package:relove/models/category.dart';
import 'package:relove/screens/categories/categories_screen.dart';
import 'package:relove/data/category_data.dart';
import 'package:relove/components/common/ReloveSliverAppBar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relove/screens/sell/sell_screen.dart';
import 'package:relove/screens/notifications/notification_screen.dart';
import 'package:relove/screens/profile/profile_screen.dart';

class Home extends StatefulWidget {
  static const id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  final screens = [
    const SellScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: kPrimaryColor,
        iconSize: 24.0,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
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
        ],
      ),
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const ReloveSliverAppBar(),
          screens[currentIndex],
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  return CategoryBubble(
                    categoryTitle: categoryData[index].title,
                    bubbleImageUrl: categoryData[index].bubbleImageUrl!,
                    onTap: () {
                      // Navigator.of(context).push(PageRouteBuilder(
                      //     pageBuilder: (context, animation, anotherAnimation) {
                      //       return CategoriesScreen();
                      //     },
                      //     transitionDuration: Duration(milliseconds: 2000),
                      //     transitionsBuilder:
                      //         (context, animation, anotherAnimation, child) {
                      //       animation = CurvedAnimation(
                      //           curve: Curves.linearToEaseOut, parent: animation);
                      //       return Align(
                      //         child: SizeTransition(
                      //           sizeFactor: animation,
                      //           child: child,
                      //           axisAlignment: 0.0,
                      //         ),
                      //       );
                      //     }));
                      Navigator.pushNamed(context, CategoriesScreen.id);
                    },
                  );
                },
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisExtent: 250.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  width: 50.0,
                  height: 50.0,
                  color: Colors.pink[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
