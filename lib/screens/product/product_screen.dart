import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/components/common/relove_custom_sliver_appbar.dart';
import 'package:relove/data/appbar_actions.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.productData}) : super(key: key);
  static const id = 'Product_screen';
  final Map<String, dynamic> productData;
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: IconButton(
          splashRadius: kButtonSplashRadius,
          splashColor: Colors.transparent,
          icon: SvgPicture.asset(
            kBackButtonImageSource,
            height: 24.0,
            width: 24.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 65.0,
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        actions: appbarActions,
      ),
    );
  }
}
