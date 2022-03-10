import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class SizeSelectorBubble extends StatelessWidget {
  const SizeSelectorBubble(
      {Key? key, required this.sizeSelectorData, required this.onTap})
      : super(key: key);

  final Map sizeSelectorData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.0,
        height: 45.0,
        // margin: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
        margin: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: sizeSelectorData['isSelected'] as bool ? kPrimaryColor : Colors.white,
          border: Border.all(
            color: sizeSelectorData['isSelected'] as bool ? kPrimaryColor : kDarkTextColor,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            sizeSelectorData['size'],
            style: TextStyle(
                color: sizeSelectorData['isSelected'] as bool ? kLightTextColor : kDarkTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }
}
