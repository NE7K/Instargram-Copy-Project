import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // firestore import

final firestore = FirebaseFirestore.instance; // firestore instance 생성

class Shop extends StatefulWidget {
  const Shop({super.key});
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() {

  }

  @override
  Widget build(BuildContext context) {
    return Text('샵 페이지임');
  }
}
