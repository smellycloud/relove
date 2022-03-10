import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/relove_custom_sliver_appbar.dart';
import 'package:relove/components/common/relove_image_bubble.dart';
import 'package:relove/components/common/rounded_bottom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellInstructionsScreen extends StatelessWidget {
  static const id = "sell_instructions_screen";

  const SellInstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 50.0,
        color: kSecondaryColor,
        child: SizedBox(
          height: 64.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RoundedBottomButton(
                  onPressed: () {
                    print('Sell screen!');
                  },
                  showBorder: false,
                  buttonText: 'SELL MY CLOTHES!',
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'How To Sell My Clothes',
          style: TextStyle(
            fontSize: 18.0,
            color: kLightTextColor,
          ),
        ),
        leading: IconButton(
          splashRadius: kButtonSplashRadius,
          splashColor: Colors.transparent,
          icon: SvgPicture.asset(
            kBackButtonImageSource,
            height: 24.0,
            width: 24.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 65.0,
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "Relove ensures you have the best experience finding new homes for your old clothes.",
                  style: TextStyle(
                    color: kDarkTextColor,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  "And best of all, deliver them to us for free!",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: ReloveImageBubble(
                  imagePath: 'assets/sell_icons/step_1.png',
                  title: '1. Order our Kit',
                  subText:
                      'This kit is delivered to you free of cost! You have the option of picking the size of your kit depending on the number of items you’d like to sell.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: ReloveImageBubble(
                  imagePath: 'assets/sell_icons/step_2.png',
                  title: '2. Fill up your Kit',
                  subText:
                      'Once you receive your kit, you’re free to fill it with all the clothes you’d like to sell. Please ensure you go through our list of accepted items before filling and sending us your kits.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: ReloveImageBubble(
                  imagePath: 'assets/sell_icons/step_3.png',
                  title: '3. Send us your Kit',
                  subText:
                      'After your kit has been filled, it’t time for you to send it to us. Use your nearest post office or delivery service to mail the kit. The delivery location is already printed onto the boxes.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: ReloveImageBubble(
                  imagePath: 'assets/sell_icons/step_4.png',
                  title: '4. Sit Back and Enjoy!',
                  subText:
                      'Once we receive your kit, we price eligible items according to their market prices. Based on these prices, you receive credit. Avail this to shop at our store!',
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 16, bottom: 16),
              //   child: RoundedBottomButton(
              //       onPressed: () {
              //         print('Sell screen');
              //       },
              //       buttonText: 'SELL MY CLOTHES!'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
