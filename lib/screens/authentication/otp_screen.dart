import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'package:relove/constants.dart';

import 'package:relove/components/authentication/ReloveLogoWithTagline.dart';
import 'package:relove/components/common/RoundedBottomButton.dart';

import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:relove/screens/home/home.dart';
import 'package:relove/screens/preferences/size_preference_screen.dart';

import 'package:relove/relove_firebase/ReloveFirestoreWrite.dart';
import 'package:relove/relove_firebase/ReloveFirestoreRead.dart';

class OTPScreen extends StatefulWidget {
  static const id = 'otp_screen';

  const OTPScreen({Key? key, required this.phoneNumber}) : super(key: key);
  final PhoneNumber phoneNumber;

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with TickerProviderStateMixin {
  FirebaseAuth auth = FirebaseAuth.instance;
  late AnimationController _controller;
  String? _verificationId;
  String? _smsCode;

  String get timerString {
    Duration duration = _controller.duration! * _controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    otpTimer();
    verify();
  }

  otpTimer() {
    // OTP Timer functionality
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
        _controller.reset();
      }
    });
    _controller.addListener(() {
      setState(() {});
    });
  }

  verify() async {
    await auth.verifyPhoneNumber(
      timeout: const Duration(seconds: kOTPCountdownTimerDuration),
      phoneNumber: widget.phoneNumber.toString(),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        var snackBar = SnackBar(
          content: Text(e.message.toString()),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      codeSent: (String verificationId, int? resendToken) async {
        setState(() {
          _verificationId = verificationId;
        });
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: _smsCode!);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _verificationId = verificationId;
        });
      },
    );
  }

  void signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationId!, smsCode: _smsCode!))
          .then((value) {
        if (value.user != null) {
          var doc = getUserDocumentSnapshot(user: value.user);
          if(doc != null) {
            print('User exists');
            if (doc(user: value.user)['size_preferences'] == null) {
              // Navigator.popAndPushNamed(context, SizePreferenceScreen.id);
              Navigator.pushNamedAndRemoveUntil(context, SizePreferenceScreen.id, ModalRoute.withName('authentication_screen'));
            } else {
              Navigator.pushNamedAndRemoveUntil(context, Home.id, ModalRoute.withName('authentication_screen'));
            }
          } else {
            if (addUserToFirestore(user: value.user) == true) {
              // Check if size prefs exist
              if (getUserDocumentSnapshot(user: value.user)['size_preferences'] == null) {
                // Navigator.popAndPushNamed(context, SizePreferenceScreen.id);
                Navigator.pushNamedAndRemoveUntil(context, SizePreferenceScreen.id, ModalRoute.withName('authentication_screen'));
              } else {
                Navigator.pushNamedAndRemoveUntil(context, Home.id, ModalRoute.withName('authentication_screen'));
              }
            } else {
              const snackBar = SnackBar(
                content: Text('Could not create user. Try again in a while'),
              );
            }
          }
        }
      });
    } catch (e) {
      var snackBar = const SnackBar(
        content: Text('Invalid OTP'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();

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
            Expanded(
              flex: 0,
              child: Padding(
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
                  onChanged: (pin) {
                    setState(() {
                      _smsCode = pin;
                    });
                  },
                  onCompleted: (pin) {
                    setState(() {
                      _smsCode = pin;
                    });
                    signIn();
                    // VALIDATE AND GO TO PREFERENCES OR HOME SCREEN
                  },
                ),
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
                        verify();
                        const snackBar = SnackBar(
                          content: Text('Sending new OTP'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        _controller.reverse(from: 1);
                      } else {
                        const snackBar = SnackBar(
                          content:
                              Text('Please wait for the countdown to complete'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.redoAlt,
                      color: kLightTextColor,
                    ),
                    iconSize: 12.0,
                    splashRadius: kButtonSplashRadius,
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
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: RoundedBottomButton(
                  buttonText: "CONTINUE",
                  onPressed: () {
                    //  Check if user account already exists and if otp is valid. If yes, go to home. If no, go to style preferences screen
                    FirebaseAuth.instance.authStateChanges().listen((User? user) {
                      // var userDocumentSnapshot = getUserDocumentSnapshot(user: user);
                      if (user == null) {
                        print('User is currently signed out!');
                        const snackBar = SnackBar(
                          content: Text('Could not create user. Try again in a while'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        print('User is signed in!');
                        var doc = getUserDocumentSnapshot(user: user);
                        if(doc == null) {
                          if (addUserToFirestore(user: user) == true) {
                            // Check if size prefs exist
                            if (doc(user: user)['size_preferences'] == null) {
                              // Navigator.popAndPushNamed(context, SizePreferenceScreen.id);
                              Navigator.pushNamedAndRemoveUntil(context, SizePreferenceScreen.id, ModalRoute.withName('authentication_screen'));
                            } else {
                              Navigator.pushNamedAndRemoveUntil(context, Home.id, ModalRoute.withName('authentication_screen'));
                            }
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Could not create user. Try again in a while'),
                            );
                          }
                        } else {
                          if (doc(user: user)['size_preferences'] == null) {
                            // Navigator.popAndPushNamed(context, SizePreferenceScreen.id);
                            Navigator.pushNamedAndRemoveUntil(context, SizePreferenceScreen.id, ModalRoute.withName('authentication_screen'));
                          } else {
                            Navigator.pushNamedAndRemoveUntil(context, Home.id, ModalRoute.withName('authentication_screen'));
                          }
                        }
                      }
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
