import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relove/constants.dart';

class WishlistButton extends StatelessWidget {
  const WishlistButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: kButtonSplashRadius,
      splashColor: Colors.transparent,
      icon: SvgPicture.asset(
        kWishlistUnselectedButtonImageSource,
        height: 24.0,
        width: 24.0,
      ),
      onPressed: onPressed,
    );
  }
}
