import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReloveNavigationTile extends StatelessWidget {
  const ReloveNavigationTile({
    Key? key,
    required this.title,
    required this.subText,
    required this.onTap,
  }) : super(key: key);

  final String title, subText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: kDarkTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  subText,
                  style: const TextStyle(
                    color: kLightSubtextColor,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
            // direction: Axis.vertical,
          ),
          SvgPicture.asset(kNavigateImageSource),
        ],
      ),
    );
  }
}
