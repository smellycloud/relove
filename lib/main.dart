import 'package:flutter/material.dart';

import 'screens/authentication/authentication_screen.dart';
import 'screens/authentication/otp_screen.dart';

import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Relove());
}

class Relove extends StatelessWidget {
  const Relove({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        defaultTransition: Transition.zoom,
      title: 'Relove',
        theme: ThemeData(
          // pageTransitionsTheme: const PageTransitionsTheme(
          //   builders: {
          //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          //   },
          // ),
          colorScheme: const ColorScheme.light(
            primary: kLightTextColor,
            secondary: kPrimaryColor,
          ),
          primaryColor: kPrimaryColor,
          splashColor: kPrimaryColor,
          secondaryHeaderColor: kLightTextColor,
          primaryColorLight: kPrimaryColor,
          primaryColorDark: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          focusColor: kLightTextColor,
          dividerColor: kLightTextColor,
          fontFamily: "Montserrat",
        ),
        home: const AuthenticationScreen(),
        routes: {
          AuthenticationScreen.id: (context) => const AuthenticationScreen(),
          // OTPScreen.id: (context) => const OTPScreen(),
        },
    );
  }
}
