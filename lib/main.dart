import 'package:flutter/material.dart';
import 'screens/authentication/authentication_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relove',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
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
      },
    );
  }
}
