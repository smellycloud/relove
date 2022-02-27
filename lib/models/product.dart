import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String name;
  List<String> imageUrls;
  Map<String, int> quantity;
  List<String> colors;
  List<String> tags;
  String fit;
  String condition;
  List<String> materials;
  List<String> occasions;
  String category;
  Map<String, Object> value;

  ProductModel({
    required this.name,
    required this.imageUrls,
    required this.quantity,
    required this.colors,
    required this.tags,
    required this.fit,
    required this.condition,
    required this.materials,
    required this.occasions,
    required this.category,
    required this.value,
  });

  factory ProductModel.fromDocumentSnapshot(
      {required documentSnapshot}) {
    return ProductModel(
      name: documentSnapshot.data()!["name"],
      imageUrls: documentSnapshot.data()!["image_urls"],
      quantity: documentSnapshot.data()!["quantity"],
      colors: documentSnapshot.data()!["colors"],
      tags: documentSnapshot.data()!["tags"],
      fit: documentSnapshot.data()!["fit"],
      category: documentSnapshot.data()!["category"],
      condition: documentSnapshot.data()!["condition"],
      occasions: documentSnapshot.data()!["occasions"],
      value: documentSnapshot.data()!["value"],
      materials: documentSnapshot.data()!["materials"],
    );
  }
}

// [{quantity: {XS: 1}, origin: "kit_id", image_urls: [https://firebasestorage.googleapis.com/v0/b/relove-73aaf.appspot.com/o/products%2Fclothing%2Fwomen%2FEBtryoPXhsfzztntFCKx.jpeg?alt=media&token=23a3d28e-d102-4df1-945b-aff7892ccedc],
// colors: [brown], tags: [sweatshirt, h&m, brown, winter, crewneck],
// fit: relaxed, condition: LW,
// materials: [cotton, wool], name: women's sweatshirt,
// occasions: [casual, business casual], category: tops,
// brand: DocumentReference<Map<String, dynamic>>(brands/h&m),
// value: {current: 1299, original: 2999, currency_symbol: ₹, currency: INR, discount_percentage: 0}}
// ]
