import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:relove/components/authentication/RoundedContinueButton.dart';
import 'package:relove/components/authentication/ReloveLogoWithTagline.dart';
import 'otp_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);
  static const id = 'authentication_screen';

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    PhoneNumber _phoneNumber = PhoneNumber();

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReloveLogoWithTagline(),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Enter Phone Number',
                style: TextStyle(
                  color: kLightTextColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, right: 32.0),
              child: InternationalPhoneNumberInput(
                inputDecoration: const InputDecoration(
                  focusColor: kLightTextColor,
                  hoverColor: kLightTextColor,
                ),
                selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    showFlags: false,
                    useEmoji: true,
                    leadingPadding: 0.0),
                hintText: '',
                spaceBetweenSelectorAndTextField: 0.0,
                scrollPadding: const EdgeInsets.all(8.0),
                onInputChanged: (value) {
                  _phoneNumber = value;
                },
                textStyle: kPhoneNumberTextStyle,
                selectorTextStyle: kPhoneNumberTextStyle,
              ),
            ),
            const SizedBox(
              height: 90,
              //  DANGEROUS - CAN CAUSE BOTTOM OVERFLOW ON SMALL SCREENS - FIX
            ),
            Center(
              child: RoundedContinueButton(
                onPressed: () {
                  // Navigator.pushNamed(context, OTPScreen.id);
                  if (_phoneNumber.parseNumber() == '') {
                    const snackBar = SnackBar(
                      content: Text('Please enter a valid phone number'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPScreen(
                          phoneNumber: _phoneNumber,
                        ),
                      ),
                    );
                  }
                  // if (_phoneNumber.parseNumber().toString() == '') {
                  //
                  // } else {
                  //   const snackBar = SnackBar(
                  //     content: Text('Please enter a valid phone number'),
                  //   );
                  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
