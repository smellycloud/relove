import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class RoundedContinueButton extends StatelessWidget {
  const RoundedContinueButton({required this.onPressed});
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: 'rounded_continue_button',
      child: Material(
        color: kPrimaryColor,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(
              color: kLightTextColor,
              width: 1.0,
            ),
          ),
          minWidth: 400.0,
          height: 40.0,
          child: const Text(
            'CONTINUE',
            style: TextStyle(
              color: kLightTextColor,
              fontSize: 16.0,
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}