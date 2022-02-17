import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/authentication/RoundedContinueButton.dart';
import 'package:relove/data.dart';
import 'package:relove/components/preferences/SizeSelectorCard.dart';

class SizePreferenceScreen extends StatefulWidget {
  static const id = 'size_preference_screen';

  const SizePreferenceScreen({Key? key}) : super(key: key);

  @override
  _SizePreferenceScreenState createState() => _SizePreferenceScreenState();
}

List<Widget> buildSizeSelectorCards() {
  List<Widget> sizeSelectorCards = [];
  List<String> keys = [];

  for (var key in sizeOptions.keys) {
    keys.add(key);
  }
  for (String category in keys) {
    sizeSelectorCards.add(SizeSelectorCard(categoryName: category));
  }
  return sizeSelectorCards;
}

class _SizePreferenceScreenState extends State<SizePreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 56.0, left: 16.0, right: 16.0),
              child: Text(
                'Please Pick Your Size Preference',
                style: TextStyle(
                    color: kLightTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                  top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Text(
                'This will be used to show you items that will be in accordance to your body type. You can always change your preferences in your profile later.',
                style: TextStyle(color: kLightTextColor, fontSize: 12.0),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView(
                children: buildSizeSelectorCards(),
                shrinkWrap: true,
              ),
            ),
            Expanded(
              flex: 1,
                child: Center(child: RoundedContinueButton(onPressed: () {}))),
          ],
        ),
      ),
    );
  }
}
