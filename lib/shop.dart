import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // firestore import

import 'package:firebase_auth/firebase_auth.dart'; // login

final auth = FirebaseAuth.instance; // login instance

final firestore = FirebaseFirestore.instance; // firestore instance 생성

class Shop extends StatefulWidget {
  const Shop({super.key});
  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() async {
    // var result = await firestore.collection('product').doc('wgKCJb2zV22c0D3hcfIu').get();
    // print(result);
    // print(result['name']);
    // if (result2.docs.isNotEmpty) {

      var result2 = await firestore.collection('product').get(); // where 조건에 맞는 데이터 (쿼리), delete 삭제 가능, update 업데이트
      for (var doc in result2.docs) {
        print(doc['name']);
    }
      // awit firestore.collection().add({'name' : '내복'~~});
    // 저장이 실패되거나 인터넷이 끊길때를 방지하기 위해서 try catch or if 사용
  }

  registerUser() async {
    try {
      var result = await auth.createUserWithEmailAndPassword( // login은 signinwith~
          email: 'kim@test.com',
          password: '123456'
      );
      result.user?.updateDisplayName('john'); // ? or !
      print(result.user);
    } catch (e) {
      print(e);
    }
  }

  loginUser() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: 'kim@test.com',
          password: '123456'
      );
    } catch (e) {
      print(e);
    }
    if(auth.currentUser?.uid == null){
      print('로그인 안된 상태군요');
    } else {
      print('로그인 하셨네');
    }
  }

  logOut() async {
    await auth.signOut();
  }


  @override
  void initState() {
    super.initState();
    getData();
    registerUser();
    loginUser();
  }

  @override
  Widget build(BuildContext context) {
    return Text('샵 페이지임');
  }
}
