import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/relove_nested_scroll_view.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return const Scaffold(
      body: Center(
        child: Text('Notifications', style: TextStyle(color: kDarkTextColor),),
      ),
    );
  }
}
