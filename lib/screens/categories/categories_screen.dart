import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/ReloveCustomSliverAppBar.dart';
import 'package:relove/data/category_data.dart';

class CategoriesScreen extends StatefulWidget {
  static const id = 'categories_screen';

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const ReloveCustomSliverAppBar(titleText: 'Categories'),
          ];
        },
        body: ListView.builder(
          itemCount: categoryData.length-1,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              color: categoryData[index+1].color,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/categoryData.length-1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(categoryData[index+1].title),
                      Text(categoryData[index+1].subtext!),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
