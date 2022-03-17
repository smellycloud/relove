import 'package:flutter/material.dart';
import 'package:relove/utilities/string_extension.dart';
import 'package:relove/constants.dart';

class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({Key? key, required this.productData})
      : super(key: key);
  final Map<String, dynamic> productData;

  List<Widget> getTextWidgets(String field) {
    List<Widget> result = [
      Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Text(
          field.toString().titleCase,
          style: const TextStyle(
            fontSize: 18.0,
            color: kDarkTextColor,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ];
    for (String value in productData[field]) {
      result.add(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            value.toString().titleCase,
            style: const TextStyle(
              fontSize: 14.0,
              color: kDarkTextColor,
            ),
          ),
        ),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getTextWidgets('materials'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getTextWidgets('fit'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Condition',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: kDarkTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                        child: Text(
                          productData['condition'],
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: kDarkTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getTextWidgets('colors'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: getTextWidgets('occasions'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
