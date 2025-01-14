// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:real/models/category_model.dart';
import 'package:real/models/product_model.dart';
import 'package:real/screen/cart/cart_screen.dart';
import 'package:real/screen/category_view.dart';
import 'package:real/screen/product_details.dart';
import 'package:real/screen/allThucPham_screen.dart';
import 'package:real/widgets/LoaiThucPham_widget.dart';
import 'package:real/widgets/ThucPham_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  late Timer _timer;

  final List<String> _bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

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
                  color: const Color.fromARGB(255, 127, 117, 117)
                      .withOpacity(0.5), // Màu viền đen mờ
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo2.jpg',
                  width: 30,
                  height: 36,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(width: 8),
              ],
            ),
            Text('ĐT - Market'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Đặt các widget con lên đầu
          crossAxisAlignment: CrossAxisAlignment
              .stretch, // Đặt các widget con kéo dài theo chiều ngang
          children: [
            //Tìm kiếm
            Padding(
              padding: EdgeInsets.only(
                  top: 12.0,
                  left: 12,
                  right: 12), // Thêm khoảng cách xung quanh TextField
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Bạn cần tìm gì?',
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 7, 116, 14),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            //Banner
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Container(
                height: 150,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _bannerImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        image: DecorationImage(
                          image: AssetImage(
                              _bannerImages[index]), // Đường dẫn tới ảnh banner
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            //Danh mục
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Danh mục',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  LoaiThucPhamWidget()
                ],
              ),
            ),

            //Sản phẩm + Danh mục
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sản phẩm',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12),
                  ThucPhamWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables ok
