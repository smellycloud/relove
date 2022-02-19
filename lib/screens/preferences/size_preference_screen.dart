import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/authentication/RoundedContinueButton.dart';
import 'package:relove/components/preferences/SizeSelectorCard.dart';
import 'package:relove/models/size_preferences.dart';

class SizePreferenceScreen extends StatelessWidget {
  static const id = 'size_preference_screen';

  const SizePreferenceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Start building SizeSelectorCards
    SizePreferences sizePreferences = SizePreferences();
    List<Widget> buildSizeSelectorCards() {
      List<Widget> sizeSelectorCards = [];
      for (String category in sizePreferences.getClothingCategoriesList()) {
        sizeSelectorCards.add(SizeSelectorCard(
            sizePreferences: sizePreferences, sizeCategoryName: category));
      }
      return sizeSelectorCards;
    }

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
              child: Center(
                child: RoundedContinueButton(
                  onPressed: () {
                    // var data = sizePreferences.sizePreferenceData;
                    // Send data => firebase userInfo document
                    // if successful -> go to home, else show snackbar
                    // verify if user has selected one size from each clothing category
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}