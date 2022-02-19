import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/appbar/search_button.dart';
import 'package:relove/components/appbar/cart_button.dart';
import 'package:relove/components/appbar/wishlist_button.dart';

import 'package:relove/data/category_data.dart';
import 'package:relove/models/category.dart';

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
          SliverAppBar(
            toolbarHeight: 65.0,
            collapsedHeight: 65.0,
            snap: true,
            pinned: true,
            floating: true,
            leadingWidth: 0.0,
            elevation: 0.0,
            leading: null,
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(
                left: 16.0,
                bottom: 16.0,
              ),
              title: Text(
                'Relove',
                style: TextStyle(
                  fontFamily: "CaviarDreams",
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            expandedHeight: 100.0,
            backgroundColor: kPrimaryColor,
            actions: [
              SearchButton(
                onPressed: () {},
              ),
              WishlistButton(
                onPressed: () {},
              ),
              CartButton(
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categoryData.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            bottom: 8.0,
                          ),
                          child: Container(
                            height: 79.0,
                            width: 64,
                            decoration: const BoxDecoration(
                              color: kCategoryBubbleBackgroundColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 6.2, top: 6.2),
                              child: Image.asset(
                                categoryData[index].bubbleImageUrl!,
                                width: 64.0,
                                height: 76.0,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          categoryData[index].title,
                          style: const TextStyle(
                            color: kDarkTextColor,
                            fontSize: 12.0
                          ),
                        )
                      ],
                    ),
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
