import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/data/category_data.dart';
import 'package:relove/components/home/category_bubble.dart';
import 'package:relove/screens/categories/categories_screen.dart';
import 'package:relove/components/product/product_card.dart';
import 'package:relove/screens/product/product_screen.dart';

class HomeScreenComponents extends StatelessWidget {
  const HomeScreenComponents({Key? key, required this.womenClothesData})
      : super(key: key);

  final womenClothesData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(
            height: 120.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryData.length,
              itemBuilder: (context, index) {
                return CategoryBubble(
                  categoryTitle: categoryData[index].title,
                  bubbleImageUrl: categoryData[index].bubbleImageUrl!,
                  onTap: () {
                    Navigator.pushNamed(context, CategoriesScreen.id);
                  },
                );
              },
            ),
          ),
          FutureBuilder(
            future: womenClothesData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 10,
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 2/2.5,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                    itemBuilder: (context, index) {
                      List data = snapshot.data as List;
                      return ProductCard(
                        productData: data[0],
                        onTap: () {
                          print("product card ${data[0]}");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductScreen(
                                productData: data[0],
                              ),
                            ),
                          );
                        },
                        // productData: data[0],
                      );
                    });
              } else {
                return const CircularProgressIndicator(
                  color: kPrimaryColor,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
