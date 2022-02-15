import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/ReloveImage.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: ReloveImage(
                width: 300.0,
                height: 250.0,
              ),
            ),
            const Center(
              child: Text(
                'Your One Stop Thrift Store',
                style: TextStyle(
                  fontFamily: "CaviarDreams",
                  fontWeight: FontWeight.bold,
                  color: kLightTextColor,
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
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
                  print(value);
                },
                textStyle: const TextStyle(
                  color: kLightTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
                selectorTextStyle: const TextStyle(
                  color: kLightTextColor,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Center(
              child: Material(
                color: kPrimaryColor,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: kLightTextColor,
                      width: 1.0,
                    ),
                  ),
                  minWidth: 400.0,
                  height: 40.0,
                  child: const Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: kLightTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
