import 'package:flutter/material.dart';
import 'package:relove/components/appbar/search_button.dart';
import 'package:relove/components/appbar/cart_button.dart';
import 'package:relove/components/appbar/wishlist_button.dart';

List<Widget>? appbarActions = [
  SearchButton(
    onPressed: () {
    },
  ),
  WishlistButton(
    onPressed: () {},
  ),
  CartButton(
    onPressed: () {},
  ),
];