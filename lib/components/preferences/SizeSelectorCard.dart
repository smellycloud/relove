import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/preferences/SizeSelectorBubble.dart';
import 'package:relove/models/size_preferences.dart';

class SizeSelectorCard extends StatefulWidget {
  const SizeSelectorCard({
    Key? key,
    required this.sizePreferences,
    required this.categoryName,
  }) : super(key: key);

  final String categoryName;
  final SizePreferences sizePreferences;

  @override
  State<SizeSelectorCard> createState() => _SizeSelectorCardState();
}

class _SizeSelectorCardState extends State<SizeSelectorCard> {
  List<Widget> buildSizeSelectorBubbles({required String categoryName}) {
    List<Widget> sizeSelectorBubbles = [];
    List<String> sizes = [];

    for (String size in widget.sizePreferences.getSizeOptionsList(categoryName: categoryName)) {
      sizeSelectorBubbles.add(SizeSelectorBubble(
        size: size,
        isSelected: widget.sizePreferences.getSizeSelectedState(categoryName: categoryName, size: size),
        onTap: () {
          setState(() {
            widget.sizePreferences.toggleSelectedState(categoryName: categoryName, size: size);
          });
        },
      ));
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
                // Capitalize first letter
                "${widget.categoryName[0].toUpperCase()}${widget.categoryName.substring(1)
                    .toLowerCase()}",
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
            children: buildSizeSelectorBubbles(categoryName: widget.categoryName),
            scrollDirection: Axis.horizontal,
          ),
        ),
      ],
    );
  }
}
