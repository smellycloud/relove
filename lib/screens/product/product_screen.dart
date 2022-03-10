import 'package:flutter/material.dart';
import 'package:relove/constants.dart';
import 'package:relove/data/appbar_actions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:relove/utilities/string_extension.dart';
import 'package:relove/components/product/size_selector_bubble.dart';
import 'package:relove/components/common/rounded_bottom_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key, required this.productData}) : super(key: key);
  static const id = 'Product_screen';
  final Map<String, dynamic> productData;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

var sizeData = [];
bool isCartButtonDisabled = true;

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    widget.productData['quantity'].forEach((key, value) {
      print("Key : $key, Value : $value");
      if (value > 0) {
        sizeData.add({
          'size': key,
          'quantity': value,
          'isSelected': false,
        });
      }
    });
    print(sizeData);
    super.initState();
  }

  toggleSizeSelector(int index) {
    for (int i = 0; i < sizeData.length; i++) {
      sizeData[i]['isSelected'] = false;
      if (index == i) {
        sizeData[index]['isSelected'] = !sizeData[index]['isSelected'];
        if (sizeData[index]['isSelected'] == true) {
          isCartButtonDisabled = false;
        }
      }
    }
    setState(() {
      print(isCartButtonDisabled);
    });
  }

  List<Widget> buildSizeSelectorBubbles({required List sizeData}) {
    List<Widget> sizeSelectorBubbles = [];
    for (int i = 0; i < sizeData.length; i++) {
      sizeSelectorBubbles.add(SizeSelectorBubble(
          sizeSelectorData: sizeData[i],
          onTap: () {
            toggleSizeSelector(i);
          }));
    }
    return sizeSelectorBubbles;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 50.0,
        color: kSecondaryColor,
        child: SizedBox(
          height: 64.0,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SvgPicture.asset(
                  kWishlistUnselectedButtonImageSource,
                  height: 32.0,
                  width: 32.0,
                  color: kLightSubtextColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: RoundedBottomButton(
                    isDisabled: isCartButtonDisabled,
                      onPressed: () {
                        if(isCartButtonDisabled) {
                          print("Disabled");
                        } else {
                          print("Add to cart");
                        }
                      },
                      showBorder: false,
                      buttonText: 'ADD TO CART'),
                ),
              ),
            ],
          ),
        ),
      ),
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
      body: ListView(
        children: [
          Image.network(
            widget.productData['image_urls'][0],
            fit: BoxFit.cover,
            height: 400.0,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${widget.productData['brand']}',
                          style: const TextStyle(
                            fontSize: 22.0,
                            color: kDarkTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          widget.productData['name'].toString().titleCase,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: kDarkTextColor,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.share_outlined,
                      color: kDarkTextColor,
                      size: 32.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      '${widget.productData['value']['currency_symbol']}${widget.productData['value']['current']}',
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: kDarkTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      '${widget.productData['value']['currency_symbol']}1999',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: kLightSubtextColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      kSellIconImageSource,
                      height: 24.0,
                      width: 24.0,
                    ),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      'Original Retail Price ${widget.productData['value']['currency_symbol']}${widget.productData['value']['original']}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: kLightSubtextColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Divider(
            thickness: kDividerThickness,
            color: kDividerColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    'Select Size',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: kDarkTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: buildSizeSelectorBubbles(sizeData: sizeData),
                    shrinkWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: GestureDetector(
                    onTap: () {
                      print('Go to size chart!');
                    },
                    child: const Text(
                      'See size chart',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 14.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: kDividerThickness,
            color: kDividerColor,
          ),

        ],
      ),
    );
  }
}
// {quantity: {XS: 1}, origin: "kit_id",
// image_urls: [https://firebasestorage.googleapis.com/v0/b/relove-73aaf.appspot.com/o/products%2Fclothing%2Fwomen%2FEBtryoPXhsfzztntFCKx.jpeg?alt=media&token=23a3d28e-d102-4df1-945b-aff7892ccedc],
// type: clothing, colors: [brown], tags: [sweatshirt, h&m, brown, winter, crewneck],
// fit: relaxed, condition: LW, materials: [cotton, wool], name: women's sweatshirt,
// occasions: [casual, business casual], category: tops, brand: H&M,
// value: {current: 1299, original: 2999, currency_symbol: ₹, currency: INR, discount_percentage: 0}}
