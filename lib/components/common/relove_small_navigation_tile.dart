import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReloveSmallNavigationTile extends StatelessWidget {
  const ReloveSmallNavigationTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0, top: 16.0, left: 16.0, right: 16.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: kDarkTextColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(kNavigateImageSource),
          ),
        ],
      ),
    );
  }
}
