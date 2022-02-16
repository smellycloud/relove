import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/ReloveImage.dart';
class ReloveLogoWithTagline extends StatelessWidget {
  const ReloveLogoWithTagline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'relove_logo',
      child: Column(
        children: const [
          Center(
            child: ReloveImage(
              width: 300.0,
              height: 250.0,
            ),
          ),
          Center(
            child: Text(
              'Your One Stop Thrift Store',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontFamily: "CaviarDreams",
                fontWeight: FontWeight.bold,
                color: kLightTextColor,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
