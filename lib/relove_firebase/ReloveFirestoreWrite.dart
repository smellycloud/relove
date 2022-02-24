import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

addUserToFirestore({user}) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  users
      .doc(user.uid)
      .set({'join_date': Timestamp.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).toString(),
  }).then((value) {
    print("Added user to firestore!");
    return true;
  }).catchError((error) {
      print("Failed to add user: $error");
      return false;
  });
}

updateUserDocument({uid, data}) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  return users
      .doc(uid)
      .update(data)
      .then((value) => print("User Updated"))
      .catchError((error) => print("Failed to update user: $error"));
}