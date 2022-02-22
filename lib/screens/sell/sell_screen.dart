import 'package:flutter/material.dart';
import 'package:relove/constants.dart';

// import 'package:flutter_svg/flutter_svg.dart';
import 'package:relove/components/common/ReloveNavigationTile.dart';
import 'package:relove/components/common/RoundedBottomButton.dart';
import 'package:relove/screens/sell/sell_instructions_screen.dart';
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
                width: MediaQuery.of(context).size.width,
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
              subText: 'Fill up our boxes with your clothes and send them to us. We’ll handle the rest!',
              onTap: () {
                print("Nav card 1 tap!");
                Navigator.pushNamed(context, SellInstructionsScreen.id);
              },
            ),
            const Divider(
              thickness: 0.5,
              color: kDividerColor,
            ),
            ReloveNavigationTile(
              title: 'Credit Scheme',
              subText: 'Once Items are received we calculate how much each item will sell for. These credits can be used inside our app!',
              onTap: () {
                print("Nav card 2 tap!");
              },
            ),
            const Divider(
              thickness: 0.5,
              color: kDividerColor,
            ),
            RoundedBottomButton(
              onPressed: () {
                print("SELL MY CLOTHES!");
              },
              buttonText: "SELL MY CLOTHES!",
              showBorder: false,
            ),
          ],
        ),
      ),
    );
  }
}
