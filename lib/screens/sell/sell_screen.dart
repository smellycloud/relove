import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: const Scaffold(
        body: Center(
          child: Text('Sell', style: TextStyle(color: kDarkTextColor),),
        ),
      ),
    );
  }
}
