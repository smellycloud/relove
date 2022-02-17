import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/preferences/SizeSelectorBubble.dart';
import 'package:relove/data.dart';

class SizeSelectorCard extends StatelessWidget {
  const SizeSelectorCard({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  final String? categoryName;

  List<Widget> buildSizeSelectorBubbles(String? categoryName) {
    List<Widget> sizeSelectorBubbles = [];
    List<String>? sizes = sizeOptions[categoryName];
    if(sizes != null) {
      for (String size in sizes) {
        sizeSelectorBubbles.add(SizeSelectorBubble(
          size: size,
          isSelected: false,
          onTap: () {},
        ));
      }
    }
    return sizeSelectorBubbles;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "${categoryName![0].toUpperCase()}${categoryName!.substring(1).toLowerCase()}",
                style: const TextStyle(
                    color: kLightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () {
                  print('Size Chart');
                },
                child: const Text(
                  'Size Chart',
                  style: TextStyle(
                      color: kLightTextColor,
                      decoration: TextDecoration.underline,
                      fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 100,
          child: ListView(
            shrinkWrap: true,
            children: buildSizeSelectorBubbles(categoryName),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}