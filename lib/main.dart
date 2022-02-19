import 'package:flutter/material.dart';

import 'screens/authentication/authentication_screen.dart';
import 'screens/preferences/size_preference_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home/home.dart';
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
      debugShowCheckedModeBanner: false,
        defaultTransition: Transition.zoom,
      title: 'Relove',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: kPrimaryColor,
            secondary: kPrimaryColor,
          ),
          // pageTransitionsTheme: const PageTransitionsTheme(
          //   builders: {
          //     TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          //   },
          // ),
          appBarTheme: const AppBarTheme(
            color: kPrimaryColor,
            foregroundColor: kPrimaryColor,
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
        home: const Home(),
        routes: {
          AuthenticationScreen.id: (context) => const AuthenticationScreen(),
          SizePreferenceScreen.id: (context) => const SizePreferenceScreen(),
          // OTPScreen.id: (context) => const OTPScreen(),
        },
    );
  }
}
