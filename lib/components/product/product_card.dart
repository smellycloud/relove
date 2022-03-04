import 'package:flutter/material.dart';
import 'package:relove/constants.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.onTap,
    // required this.productData
  }) : super(key: key);

  final VoidCallback onTap;
  // final dynamic productData;
  //
  // final name = productData['name'];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: Image.asset(kCardBackgroundImageSource).image,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'H&M',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: kDarkTextColor,
                      ),
                    ),
                    Text(
                      'moo',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: kLightSubtextColor,
                      ),
                    ),
                    Text(
                      '₹999',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
