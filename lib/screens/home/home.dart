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

// class _HomeState extends State<Home> {
//   int _currentScreenIndex = 0;
//   late final ScrollListener _model;
//   late final ScrollController _controller;
//   final double _bottomNavBarHeight = 56;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = ScrollController();
//     _model = ScrollListener.initialise(_controller);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     PageController _pageController = PageController();
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: AnimatedBuilder(
//           animation: _model,
//           builder: (context, child) {
//             return Stack(
//               children: [
//                 ReloveNestedScrollView(
//                   child: PageView(
//                     scrollDirection: Axis.horizontal,
//                     controller: _pageController,
//                     children: BottomNavigationBarData.screens,
//                     onPageChanged: (index) {
//                       setState(() {
//                         _currentScreenIndex = index;
//                       });
//                     },
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   bottom: _model.bottom,
//                   child: SizedBox(
//                     height: _bottomNavBarHeight,
//                     child: BottomNavigationBar(
//                       selectedItemColor: kPrimaryColor,
//                       iconSize: 24.0,
//                       selectedFontSize: 12.0,
//                       unselectedFontSize: 12.0,
//                       currentIndex: _currentScreenIndex,
//                       showUnselectedLabels: false,
//                       onTap: (index) {
//                         setState(() {
//                           _currentScreenIndex = index;
//                           _pageController.animateToPage(
//                             _currentScreenIndex,
//                             duration: const Duration(milliseconds: 300),
//                             curve: Curves.linear,
//                           );
//                         });
//                       },
//                       elevation: 0.0,
//                       type: BottomNavigationBarType.fixed,
//                       items:
//                           BottomNavigationBarData.bottomNavigationBarItemList,
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//     );
//   }
// }
//
// class ScrollListener extends ChangeNotifier {
//   double bottom = 0;
//   double _last = 0;
//
//   ScrollListener.initialise(ScrollController controller, [double height = 56]) {
//     controller.addListener(() {
//       final current = controller.offset;
//       bottom += _last - current;
//       if (bottom <= -height) bottom = -height;
//       if (bottom >= 0) bottom = 0;
//       _last = current;
//       if (bottom <= 0 && bottom >= -height) notifyListeners();
//     });
//   }
// }
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