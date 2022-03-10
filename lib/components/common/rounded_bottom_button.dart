import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

class RoundedBottomButton extends StatelessWidget {
  const RoundedBottomButton({required this.onPressed,
    required this.buttonText,
    this.isDisabled = false,
    this.showBorder = true,
    Key? key})
      : super(key: key);
  final VoidCallback onPressed;
  final String buttonText;
  final bool showBorder;
  final bool isDisabled;

  final _borderSide = const BorderSide(
    color: kLightTextColor,
    width: 1.0,
  );

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: 'rounded_bottom_button',
      child: MaterialButton(
        focusElevation: 0.0,
        highlightElevation: 0.0,
        disabledElevation: 0.0,
        hoverElevation: 0.0,
        color: isDisabled ? kLightSubtextColor : kPrimaryColor,
        elevation: 0.0,
        textColor: kLightTextColor,
        height: 40.0,
        splashColor: isDisabled ? Colors.transparent : kPrimaryColor,
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: showBorder ? _borderSide : BorderSide.none,
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: kLightTextColor,
            fontSize: 16.0,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
