import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:relove/models/product.dart';

getUserDocumentSnapshot({required user}) {
  FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print('Document data: ${documentSnapshot.data()}');
      return documentSnapshot;
    } else {
      print('Document does not exist on the database');
      return null;
    }
  });
}

getBrandDocumentSnapshot({required brandName}) {
  FirebaseFirestore.instance
      .collection('brands')
      .doc(brandName)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      print('Document data: ${documentSnapshot.data()}');
      return documentSnapshot;
    } else {
      print('Document does not exist on the database');
      return null;
    }
  });
}

getAllWomenClothing() async {
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('products/clothing/women');
  QuerySnapshot _querySnapshot = await _collectionRef.get();
  // var _productList = <Product>[];
  // Get data from docs and convert map to List
  final _allData = _querySnapshot.docs.map((doc) => doc.data()).toList();
  print('getAllWomenClothing(): $_allData');
  // for(Map<String, Object> item in _allData as List) {
  //   _productList.add(Product.fromItem(item));
  //   print('product $_productList');
  //   // print(Product(item));
  // }
  return _allData as List;
}

getAllWomenClothingRef() {
  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('products/clothing/women');
  return _collectionRef;
}
