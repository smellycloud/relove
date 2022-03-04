import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

// import 'package:relove/components/appbar/search_button.dart';
// import 'package:relove/components/appbar/cart_button.dart';
// import 'package:relove/components/appbar/wishlist_button.dart';
import 'package:relove/data/appbar_actions.dart';

class ReloveSliverAppBar extends StatelessWidget {
  const ReloveSliverAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      // add on stretch trigger to refresh
      stretch: true,
      toolbarHeight: 65.0,
      collapsedHeight: 65.0,
      snap: true,
      pinned: true,
      floating: true,
      leadingWidth: 0.0,
      elevation: 0.0,
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
      actions: appbarActions,
    );
  }
}
