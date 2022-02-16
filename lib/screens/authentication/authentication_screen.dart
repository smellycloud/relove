import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/ReloveImage.dart';
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
    PhoneNumber _phoneNumber;
    bool _emptyPhoneNumber = true;
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
                  setState(() {
                    _phoneNumber = value;
                    _emptyPhoneNumber = _phoneNumber.props.isEmpty;
                    print(_emptyPhoneNumber);
                  });
                },
                textStyle: kPhoneNumberTextStyle,
                selectorTextStyle: kPhoneNumberTextStyle,
              ),
            ),
            const SizedBox(
              height: 90,
            //  DANGEROUS - CAN CAUSE BOTTOM OVERFLOW ON SMALL SCREENS - FIX
            ),
            if (_emptyPhoneNumber == true) ...[
              Center(
                child: RoundedContinueButton(
                  onPressed: () {
                    Navigator.pushNamed(context, OTPScreen.id);
                  },
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
