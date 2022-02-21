import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              padding: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kPrimaryColor
                  // image: DecorationImage(
                  //     image: Image.asset(kCardBackgroundImageSource).image,
                  //     fit: BoxFit.fill),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Sell on Relove! [Add bg image]',
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: kLightTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Economical. Planet friendly. Keep with the trends everyday.',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                        color: kLightTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0, top: 16.0),
                      child: Text(
                        'How it works',
                        style: TextStyle(
                            color: kDarkTextColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'Fill up our boxes with your clothes and send them to us. We’ll handle the rest!',
                        style: TextStyle(
                          color: Color(0xFFACACAC),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                  direction: Axis.vertical,
                ),
                SvgPicture.asset(kNavigateImageSource),
              ],
            ),
            const Divider(
              thickness: 0.5,
              color: Color(0xFFF5F5F5),
            )
          ],
        ),
      ),
    );
  }
}
