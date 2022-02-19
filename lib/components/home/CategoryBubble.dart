import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class CategoryBubble extends StatelessWidget {
  const CategoryBubble({
    required this.bubbleImageUrl,
    required this.categoryTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String bubbleImageUrl;
  final String categoryTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 8.0,
              ),
              child: Container(
                height: 79.0,
                width: 64,
                decoration: const BoxDecoration(
                  color: kCategoryBubbleBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 6.2, top: 6.2),
                  child: Image.asset(
                    bubbleImageUrl,
                    width: 64.0,
                    height: 76.0,
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
          Text(
            categoryTitle,
            style: const TextStyle(
                color: kDarkTextColor,
                fontSize: 12.0
            ),
          )
        ],
      ),
    );
  }
}
