import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:relove/constants.dart';
import 'package:relove/data/appbar_actions.dart';
import 'package:relove/data/category_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 18.0,
            color: kLightTextColor,
          ),
        ),
        leading: IconButton(
          splashRadius: kButtonSplashRadius,
          splashColor: Colors.transparent,
          icon: SvgPicture.asset(
            kBackButtonImageSource,
            height: 24.0,
            width: 24.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 65.0,
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        actions: appbarActions,
      ),
      body: ListView.builder(
        shrinkWrap: false,
        itemCount: categoriesCount - 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      categoryData(index + 1).title,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      categoryData(index + 1).subtext!,
                      style: const TextStyle(
                          fontSize: 12.0, color: kLightSubtextColor),
                    ),
                  ],
                ),
                Image.asset(
                  categoryData(index + 1).imageUrl!,
                  height: 100,
                  width: 100,
                  // fit: BoxFit.contain,
                  // alignment: Alignment.bottomCenter,
                ),
              ],
            ),
            iconColor: Colors.transparent,
            collapsedIconColor: Colors.transparent,
            backgroundColor: categoryData(index + 1).color,
            collapsedBackgroundColor: categoryData(index + 1).color,
            collapsedTextColor: kDarkTextColor,
            textColor: kDarkTextColor,
            // children: [
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 16.0, right: 16.0, top: 32.0),
            //             child: Text(
            //               categoryData[index + 1].title,
            //               style: const TextStyle(
            //                   fontSize: 20.0, fontWeight: FontWeight.w600),
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.only(
            //                 left: 16.0, right: 16.0, bottom: 32.0),
            //             child: Text(
            //               categoryData[index + 1].subtext!,
            //               style: const TextStyle(
            //                   fontSize: 12.0, color: kLightSubtextColor),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ],
          );
        },
      ),
    );
  }
}
