import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReloveCustomSliverAppBar extends StatelessWidget {
  const ReloveCustomSliverAppBar({
    Key? key,
    required this.titleText,
  }) : super(key: key);
  final String titleText;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        titleText,
      ),
      titleTextStyle:
          const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
      leading: IconButton(
        iconSize: 24.0,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(kBackButtonImageSource),
      ),
      toolbarHeight: 65.0,
      collapsedHeight: 65.0,
      snap: true,
      pinned: true,
      floating: true,
      elevation: 0.0,
      expandedHeight: 100.0,
      backgroundColor: kPrimaryColor,
    );
  }
}
