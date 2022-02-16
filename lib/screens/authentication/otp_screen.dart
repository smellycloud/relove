import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/authentication/ReloveLogoWithTagline.dart';
import 'package:relove/components/authentication/RoundedContinueButton.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OTPScreen extends StatefulWidget {
  static const id = 'otp_screen';

  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  late AnimationController _controller;

  String get timerString {
    Duration duration = _controller.duration! * _controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: kOTPCountdownTimerDuration,
      ), // gameData.levelClock is a user entered number elsewhere in the application
    );
    _controller.reverse(from: 1);

    _controller.addStatusListener((status) {
      print(status);
      if (_controller.isDismissed) {
        setState(() {
          // print('reset timer now');
          _controller.reset();
        });
      }
    });

    _controller.addListener(() {
      setState(() {
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();

    String _otp;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ReloveLogoWithTagline(),
            Expanded(
              flex: 0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Enter OTP',
                      style: TextStyle(
                        color: kLightTextColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: Text(
                      timerString,
                      style: const TextStyle(
                        color: kLightTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 32.0,
              ),
              child: OTPTextField(
                margin: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                ),
                otpFieldStyle: OtpFieldStyle(
                  backgroundColor: Colors.white10,
                  borderColor: Colors.transparent,
                  disabledBorderColor: Colors.transparent,
                  enabledBorderColor: Colors.transparent,
                  errorBorderColor: Colors.transparent,
                  focusBorderColor: Colors.transparent,
                ),
                controller: otpController,
                // margin: EdgeInsets.symmetric(horizontal: 0),
                length: 6,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.start,
                fieldWidth: 50,
                style: const TextStyle(
                  fontSize: 24,
                  color: kLightTextColor,
                  fontWeight: FontWeight.bold,
                ),
                fieldStyle: FieldStyle.box,
                onChanged: (value) {
                  _otp = value;
                },
                onCompleted: (value) {
                  _otp = value;
                  // VALIDATE AND GO TO PREFERENCES OR HOME SCREEN
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      //  Coordinate with timer
                      if (_controller.isDismissed) {
                        _controller.reverse(from: 1);
                      } else {
                        const snackBar = SnackBar(
                          content: Text('Please wait for the countdown to complete'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.redoAlt,
                      color: kLightTextColor,
                    ),
                    iconSize: 12.0,
                    splashRadius: 20.0,
                  ),
                  const Text(
                    'SEND AGAIN',
                    style: TextStyle(
                      color: kLightTextColor,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 90,
              //  DANGEROUS - CAN CAUSE BOTTOM OVERFLOW ON SMALL SCREENS - FIX
            ),
            Center(
              child: RoundedContinueButton(
                onPressed: () {
                  //  Check if user account already exists. If yes, go to home. If no, go to style preferences screen
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
