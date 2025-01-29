import 'package:flutter/material.dart';
import './style.dart' as style; // style에서 파일 가져오겠읍니다

import 'package:http/http.dart' as http; // http import, permission
import 'dart:convert';

void main() {
  runApp(
      MaterialApp(
          theme: style.theme, // style 가져와서 적용시킬게요
          home:  MyApp()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var tab = 0; // tab state 상태 저장 함수
  var data = [];

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색 지정
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.lock_outline_rounded)), // 잠금 상태?
              Text('Instargram'), // 계정 이름
              IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)) // 계정 추가 및 변경
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)), // 릴스, 게시물, 스토리 등등 활동 추가
            IconButton(onPressed: () {}, icon: Icon(Icons.menu)) ]  // 설정 및 활동
      ),
      body: [HomePage(data : data), Text('검색창')][tab], // list 형식으로 간단하게 페이지 할당
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false, // tab 눌렀을 때 라벨 글자 나오지 않게 설정
        showUnselectedLabels: false,
        onTap: (i) {
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈페이지'),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: '검색창'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: '추가'),
          // BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: '릴스'),
          // BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: '사용자')
        ],
      )
    );
  }
}

// HomePage 레이아웃
class HomePage extends StatelessWidget {
  const HomePage({super.key, this.data});

  final data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: 3, itemBuilder: (c, i) {
      return Column( // return이 왜 존재해야 하는지?
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(data[i]['image']),
          Text(data[i]['likes'].toString()),
          Text('글쓴이'),
          Text('글내용')
        ],
      );
    });
  }
}








