import 'package:flutter/material.dart';
import './style.dart' as style;

void main() {
  runApp(
      MaterialApp(
        theme: style.theme,
          home:  MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.video_library_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.person_outline)),
          ],
        )
      ),
    );
  }
}

// Bottom Appbar
class bottomUI extends StatelessWidget {
  const bottomUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
