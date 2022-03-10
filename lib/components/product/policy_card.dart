import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class PolicyCard extends StatelessWidget {
  const PolicyCard({
    Key? key,
    required this.title,
    required this.subText,
    required this.iconLocation,
  }) : super(key: key);

  final String title;
  final String subText;
  final String iconLocation;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset(iconLocation)
                      .image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: kDarkTextColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subText,
                      style: const TextStyle(
                        color: kLightSubtextColor,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}