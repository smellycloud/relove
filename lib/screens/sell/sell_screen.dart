import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:relove/components/common/ReloveNavigationTile.dart';
import 'package:relove/components/common/RoundedBottomButton.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                height: 200.0,
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
            ),
            ReloveNavigationTile(
              title: 'How it works',
              subText: 'Try to stop this text from overflowing',
              onTap: () {
                print("Nav card 1 tap!");
              },
            ),
            const Divider(
              thickness: 0.5,
              color: kDividerColor,
            ),
            ReloveNavigationTile(
              title: 'Credit Scheme',
              subText: 'Try to stop this text too from overflowing',
              onTap: () {
                print("Nav card 2 tap!");
              },
            ),
            const Divider(
              thickness: 0.5,
              color: kDividerColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: RoundedBottomButton(
                onPressed: () {
                  print("SELL MY CLOTHES!");
                },
                buttonText: "SELL MY CLOTHES!",
                showBorder: false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
