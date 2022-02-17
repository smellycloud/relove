import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class SizeSelectorBubble extends StatelessWidget {
  const SizeSelectorBubble(
      {Key? key, required this.size, required this.isSelected, required this.onTap})
      : super(key: key);

  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.0,
        height: 50.0,
        margin: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? kSizeBubbleSelectedColor : kSizeBubbleDefaultColor,
          border: Border.all(
            color: kSizeBubbleBorderColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: const TextStyle(
                color: kLightTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
