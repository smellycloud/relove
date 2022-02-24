import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/ReloveCustomSliverAppBar.dart';
import 'package:relove/components/common/ReloveImageBubble.dart';
import 'package:relove/components/common/RoundedBottomButton.dart';

class SellInstructionsScreen extends StatelessWidget {
  static const id = "sell_instructions_screen";

  const SellInstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            const ReloveCustomSliverAppBar(
              titleText: 'How To Sell My Clothes',
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Relove ensures you have the best experience finding new homes for your old clothes.",
                    style: TextStyle(
                      color: kDarkTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Padding(
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
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ReloveImageBubble(
                    imagePath: 'assets/sell_icons/step_1.png',
                    title: '1. Order our Kit',
                    subText:
                        'This kit is delivered to you free of cost! You have the option of picking the size of your kit depending on the number of items you’d like to sell.',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ReloveImageBubble(
                    imagePath: 'assets/sell_icons/step_2.png',
                    title: '2. Fill up your Kit',
                    subText:
                        'Once you receive your kit, you’re free to fill it with all the clothes you’d like to sell. Please ensure you go through our list of accepted items before filling and sending us your kits.',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ReloveImageBubble(
                    imagePath: 'assets/sell_icons/step_3.png',
                    title: '3. Send us your Kit',
                    subText:
                        'After your kit has been filled, it’t time for you to send it to us. Use your nearest post office or delivery service to mail the kit. The delivery location is already printed onto the boxes.',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: ReloveImageBubble(
                    imagePath: 'assets/sell_icons/step_4.png',
                    title: '4. Sit Back and Enjoy!',
                    subText:
                        'Once we receive your kit, we price eligible items according to their market prices. Based on these prices, you receive credit. Avail this to shop at our store!',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: RoundedBottomButton(
                      onPressed: () {
                        print('Sell screen');
                      },
                      buttonText: 'SELL MY CLOTHES!'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
