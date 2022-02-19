import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/home/CategoryBubble.dart';
import 'package:relove/screens/categories/categories_screen.dart';
import 'package:relove/data/category_data.dart';
import 'package:relove/components/common/ReloveSliverAppBar.dart';
import 'package:flutter/animation.dart';
class Home extends StatefulWidget {
  static const id = 'home';

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const ReloveSliverAppBar(),
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
