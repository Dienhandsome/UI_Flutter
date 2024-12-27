

  // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:real/models/category_model.dart';
import 'package:real/models/product_model.dart';
import 'package:real/screen/category_view.dart';
import 'package:real/screen/product_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  late ProductModel product;
  int _currentPage = 0;
  late Timer _timer;

  final List<String> _bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
    'assets/images/banner3.jpg',
  ];

  final List<CategoryModel> categoriesList = [
    CategoryModel(
      image: 'assets/images/category1.jpg',
      products: [
        ProductModel(imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.TXjMRAiUz5Fx6hU5slDNHQHaGU&pid=Api&P=0&h=180', name: '', price: ''),
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.oB08J_GVu4N96BG8MJhlPgHaHa&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.61tyON9ydI8x6lxev1ZlygHaG4&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.0uGAuqvhMSg36nuUJvPlCQHaHa&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.1vXSmAyiSwC3eSKjRuicewHaJy&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse4.mm.bing.net/th?id=OIP.Ig8ocZc1Z4gBl46X5mZDrwHaG3&pid=Api&P=0&h=180',name: '', price: ''),
      ],
    ),
    CategoryModel(
      image: 'assets/images/category2.jpg',
      products: [ 
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.p4ShYZkCKx6UZEq5aOuOwQHaE1&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.jEJ6UnJMPEAEnxD68mOkRAHaEl&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.pjbUBm4nnX5nNGp2FqB5WwHaDk&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.t5rP0CvS0tBGSbhlDq3TbwHaEK&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.eR1Ka7PoobAGbyoNntAjtQHaEo&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.jbjZ0MZ9W4wKPaXAvImvsQHaHa&pid=Api&P=0&h=180',name: '', price: ''),
      ],
    ),
    CategoryModel(
      image: 'assets/images/category3.jpg',
      products: [
        ProductModel(imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.TtDe_6uMVFCWlI589foOgQHaHa&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.kjythFh_NZuHOA_o7T6i7AHaHa&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse1.mm.bing.net/th?id=OIP.yxRNaxDznwA1b79wJbYwGAHaHa&pid=Api&P=0&h=180',name: '', price: ''),
      ],
    ),
    CategoryModel(
      image: 'assets/images/category4.jpg',
      products: [
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.gGcHq9omSNT3Cj2iL-V3jAHaE6&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.yE-TBtnxltWNVYlS5LkLDwHaFj&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.FQ2j6s8HETuR-KvPlrEjHgHaHa&pid=Api&P=0&h=180',name: '', price: ''),
      ],
    ),
    CategoryModel(
      image: 'assets/images/category5.jpg',
      products: [
        ProductModel(imageUrl: 'https://tse3.mm.bing.net/th?id=OIP.Auc77FKDft0XxzROn9n1gAHaEo&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.c5grqFlHem4kdMw6iCIljQHaE8&pid=Api&P=0&h=180',name: '', price: ''),
        ProductModel(imageUrl: 'https://tse2.mm.bing.net/th?id=OIP.OnGq7MYe6CMb37EpzQ-NEgHaEM&pid=Api&P=0&h=180',name: '', price: ''),
      ],
    ),
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
                  color: const Color.fromARGB(255, 28, 27, 27).withOpacity(0.5), // Màu viền đen mờ
                  width: 2.0,
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
            SizedBox(width: 8),
            Text('ĐT - Market'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                          image: AssetImage(_bannerImages[index]), // Đường dẫn tới ảnh banner
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
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
                  categoriesList.isEmpty
                      ? Center(
                          child: Text('Categories is empty'),
                        )
                      : SingleChildScrollView(
                          padding: EdgeInsets.only(left: 12.0),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: categoriesList
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CategoryView(categoryModel: e),
                                            ),
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(12.0), // Bo góc cả Card
                                          child: Card(
                                            color: Colors.white,
                                            elevation: 6.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(12.0), // Bo góc tấm ảnh
                                              child: SizedBox(
                                                height: 100,
                                                width: 100,
                                                child: Image.asset(e.image, fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        ),
                ],
              ),
            ),
  
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
      GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(12.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 sản phẩm trên 1 hàng
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.6, // Điều chỉnh tỉ lệ sản phẩm
        ),
        itemCount: categoriesList.expand((category) => category.products).length,
        itemBuilder: (context, index) {
          final product = categoriesList.expand((category) => category.products).toList()[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 12.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    product.imageUrl,
                    height: 70,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 2.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  'Price: \$${product.price}',
                  style: TextStyle(fontSize: 14),
                ),
               
               
                SizedBox(height: 4.0),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: OutlinedButton(
                    onPressed: () {
                      // Thêm logic xử lý khi nhấn nút
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.black, width: 1.5),
                    ),
                    child: Text(
                      'Buy',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ],
  ),
)

          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables