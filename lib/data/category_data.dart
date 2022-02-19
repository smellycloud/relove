import 'package:relove/models/category.dart';
import 'package:flutter/material.dart';
import 'package:relove/screens/categories/categories_screen.dart';

var categoryData = [
  Category(
    id: '0',
    title: 'All',
    onTapNavigation: () {},
    imageUrl: "",
    bubbleImageUrl: "assets/category_bubble_images/all.png",
    namedRoute: CategoriesScreen.id,
  ),
  Category(
    id: '1',
    title: 'Women',
    subtext: "Tops, Tees, Kurtis, Dresses and more",
    onTapNavigation: () {},
    imageUrl: "assets/category_images/accessories.png",
    bubbleImageUrl: "assets/category_bubble_images/women.png",
    color: const Color(0xFFDEEEFF),
    subCategories: [
      Category(id: '1.1', title: "See All Women’s", onTapNavigation: () {}),
      Category(id: '1.2', title: "T-Shirts", onTapNavigation: () {}),
      Category(id: '1.3', title: "Kurtas and suits", onTapNavigation: () {}),
      Category(id: '1.4', title: "Kurtis and Tunics", onTapNavigation: () {}),
      Category(id: '1.5', title: "Tops", onTapNavigation: () {}),
      Category(id: '1.6', title: "Jeans and Denims", onTapNavigation: () {}),
      Category(
          id: '1.7', title: "Culottes and Trousers", onTapNavigation: () {}),
    ],
  ),
  Category(
    id: '2',
    title: 'Men',
    subtext: "Tshirts, Shirts, Jeans and more",
    onTapNavigation: () {},
    imageUrl: "assets/category_images/accessories.png",
    bubbleImageUrl: "assets/category_bubble_images/men.png",
    color: const Color(0xFFFFF3EE),
  ),
  Category(
    id: '3',
    title: 'Kids',
    subtext: "Tshirts, Pants, Onesies and more",
    onTapNavigation: () {},
    imageUrl: "assets/category_images/accessories.png",
    bubbleImageUrl: "assets/category_bubble_images/kids.png",
    color: const Color(0xFFDEDFFF),
  ),
  Category(
    id: '4',
    title: 'Beauty',
    subtext: "Makeup, Skincare and more",
    onTapNavigation: () {},
    imageUrl: "assets/category_images/accessories.png",
    bubbleImageUrl: "assets/category_bubble_images/beauty.png",
    color: const Color(0xFFFDEAFE),
  ),
  Category(
    id: '5',
    title: 'Accessories',
    subtext: "Earrings, Rings, Necklaces and more",
    onTapNavigation: () {},
    imageUrl: "assets/category_images/accessories.png",
    bubbleImageUrl: "assets/category_images/accessories.png",
    color: const Color(0xFFEDFFEF),
  ),
];

get categoryDataLength {
  categoryData.length;
}
