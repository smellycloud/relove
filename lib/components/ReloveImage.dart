import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class ReloveImage extends StatelessWidget {
  const ReloveImage({required this.width, required this.height});

  final width;
  final height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      kLogoImageSource,
      width: width,
      height: height,
    );
  }
}