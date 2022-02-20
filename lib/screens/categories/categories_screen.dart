import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/ReloveSliverAppBar.dart';

class CategoriesScreen extends StatefulWidget {
  static const id = 'categories_screen';

  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          ReloveSliverAppBar(),
        ],
      ),
    );
  }
}
