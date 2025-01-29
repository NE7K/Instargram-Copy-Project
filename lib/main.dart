import 'package:flutter/material.dart';
import './style.dart' as style; // style에서 파일 가져오겠읍니다

import 'package:http/http.dart' as http; // http import, permission
import 'dart:convert';

import 'package:flutter/rendering.dart'; // scroll 관련 import

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
    // 데이터 전송을 확인하려면 if statcode 200이런거 사용할 수 있음
    var result2 = jsonDecode(result.body);
    setState(() {
      data = result2;
    });
  }

  @override
  void initState() {
    super.initState();
    getData(); // 앱 실행하면 data 뜯어오기
  }

  addData(a) {
    setState(() {
      data.add(a); // data[]에 자료 추가
    });
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
      body: [HomePage(data : data, addData : addData), Text('검색창')][tab], // list 형식으로 간단하게 페이지 할당, future builder 사용해서 if 사용 안 할 수 있음
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
class HomePage extends StatefulWidget {
  const HomePage({super.key, this.data, this.addData});

  final data;
  final addData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var scroll = ScrollController(); // controller

  var addlist = []; // 추가할 데이터 정보

  var isLoading = false; // 더보기 로딩 이어지는 오류 방지

  getMore() async { // async await은 함수에서만 사용가능 > .body 사용 가능
    if (isLoading) return; // 이미 로딩 중이면 추가 요청 방지
    setState(() {
      isLoading = true; // 로딩 시작
    });

    var addcontent = await http.get(Uri.parse('https://codingapple1.github.io/app/more1.json')); // get
    var addcontent2 = jsonDecode(addcontent.body);

    widget.addData(addcontent2);
    setState(() {
      isLoading = true;
    });
  }

  @override
  void initState() { // scroll 출력
    super.initState();
    scroll.addListener(() {
      if(scroll.position.pixels == scroll.position.maxScrollExtent && !isLoading) { // isloading 추가
        // scroll 얼만큼 ? == 가능한 스크롤 얼만큼 남았는지 > 맨 밑
        getMore();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(widget.data.isNotEmpty) { // isNotEmpty = 데이터가 오지 않은 경우
      return ListView.builder(itemCount: widget.data.length, controller: scroll, itemBuilder: (c, i) { // scroll 얼만큼?
        return Column( // return이 왜 존재해야 하는지?
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.data[i]['image']),
            Text('좋아요 : ${widget.data[i]['likes']}'),
            Text('글쓴이 : ${widget.data[i]['user']} '),
            Text('글내용 : ${widget.data[i]['content']} '),
          ],
        );
      });
    }
    else {
      return Text('로딩중');
    }
  }
}