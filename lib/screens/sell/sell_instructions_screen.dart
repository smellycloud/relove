import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellInstructionsScreen extends StatelessWidget {
  static const id = "sell_instructions_screen";

  const SellInstructionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text(
                'How To Sell My Clothes',
              ),
              titleTextStyle:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              automaticallyImplyLeading: false,
              leading: IconButton(
                iconSize: 24.0,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(kBackButtonImageSource),
              ),
              toolbarHeight: 65.0,
              collapsedHeight: 65.0,
              snap: true,
              pinned: true,
              floating: true,
              elevation: 0.0,
              expandedHeight: 100.0,
              backgroundColor: kPrimaryColor,
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Relove ensures you have the best experience finding new homes for your old clothes.",
                style: TextStyle(
                  color: kDarkTextColor,
                  fontSize: 16.0,
                ),
              ),
              const Text(
                "And best of all, deliver them to us for free!",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor,
                      ),
                      height: 160.0,
                      width: 160.0,
                      child: Image.asset(
                        'assets/sell_icons/step_1.png',
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
