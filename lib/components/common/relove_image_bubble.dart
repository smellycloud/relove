import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class ReloveImageBubble extends StatelessWidget {
  const ReloveImageBubble({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subText,
  }) : super(key: key);

  final String imagePath;
  final String? title;
  final String? subText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: Image.asset(kCardBackgroundImageSource).image,
              fit: BoxFit.cover,
            ),
          ),
          height: 160.0,
          width: 160.0,
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Image.asset(
              imagePath,
              height: 80.0,
              width: 80.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            title!,
            style: const TextStyle(fontSize: 16.0, color: kDarkTextColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            subText!,
            style: const TextStyle(
              fontSize: 14.0,
              color: kLightSubtextColor,
            ),
          ),
        ),
      ],
    );
  }
}
