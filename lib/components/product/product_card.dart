import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:intl/intl.dart';
import 'package:relove/utilities/string_extension.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.onTap,
    required this.productData,
    // required this.productData
  }) : super(key: key);

  final Map<String, dynamic> productData;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    NumberFormat _myFormat = NumberFormat.decimalPattern('en_us');
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.network(productData['image_urls'][0], fit: BoxFit.cover,)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, top: 8.0),
                      child: Text(
                        '${productData['brand']}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: kDarkTextColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        productData['name'].toString().titleCase,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: kLightSubtextColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        '${productData['value']['currency_symbol']}${_myFormat.format(productData['value']['current'])}',
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
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
