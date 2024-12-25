// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromARGB(255, 28, 27, 27).withOpacity(0.5), // Màu viền đen mờ
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(25.0), // Bo tròn viền
                color: Colors.white,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo2.jpg',
                  width: 30,
                  height: 36,
                  fit: BoxFit.cover, // Đảm bảo ảnh khớp với viền
                ),
              ),
            ),
            SizedBox(width: 8), // Khoảng cách giữa ảnh và văn bản
            Text('ĐT - Market'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Đặt các widget con lên đầu
        crossAxisAlignment: CrossAxisAlignment.stretch, // Đặt các widget con kéo dài theo chiều ngang
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12.0, left: 12, right: 12), // Thêm khoảng cách xung quanh TextField
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
                hintText: 'Bạn cần tìm gì?',
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text("Welcome to Home Screen"),
            ),
          ),
        ],
      ),
    );
  }
}