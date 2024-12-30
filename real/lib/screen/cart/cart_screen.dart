// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<Map<String, dynamic>> cartItems = [
    {"name": "Bánh Mì Bơ", "price": 40000, "quantity": 1},
    {"name": "Sữa Tươi", "price": 20000, "quantity": 2},
    {"name": "Trứng Gà", "price": 35000, "quantity": 1},
    {"name": "Nước Ngọt", "price": 15000, "quantity": 3},
  ];

  // Hàm tăng số lượng sản phẩm
  void increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity']++;
    });
  }

  // Hàm giảm số lượng sản phẩm
  void decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity']--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(42.0), // Chiều cao của AppBar
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28.0),
            bottomRight: Radius.circular(28.0),
          ),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios,
                  color: const Color.fromARGB(255, 39, 38, 38)),
              padding: EdgeInsets.only(left: 10),
              iconSize: 17,
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("Giỏ Hàng", style: TextStyle(fontSize: 23)),
            centerTitle: true,
            elevation: 0.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 46, 121, 49)!, // Màu xanh lá đậm
                    Colors.green[500]!, // Màu xanh lá trung bình
                    const Color.fromARGB(
                        255, 24, 172, 100)!, // Màu xanh lá nhạt hơn
                  ],
                  begin: Alignment.topLeft, // Điểm bắt đầu gradient
                  end: Alignment.bottomRight, // Điểm kết thúc gradient
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        //shrinkWrap: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Thông tin giao hàng
            Container(
              margin: EdgeInsets.fromLTRB(6, 12, 6, 6),
              padding: EdgeInsets.all(8), // Padding bên trong
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                children: [
                  Text(
                    "Giao đến",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4), // Khoảng cách nhỏ giữa các phần
                  Text(
                    "14/8 đường số 4 , Phường Hiệp Bình Phước (Q.Thủ Đức, TP.HCM)",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 122, 116, 116),
                        fontSize: 13),
                  ),
                  Text(
                    "Chị Đạt, 012345678",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 122, 116, 116),
                        fontSize: 13),
                  ),
                  Text(
                    "Giao trước 16h hôm nay",
                    style: TextStyle(
                        color: const Color.fromARGB(255, 25, 122, 28),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            //Danh sách sản phẩm
            Container(
              margin: EdgeInsets.fromLTRB(6, 12, 6, 6),
              padding: EdgeInsets.all(8), // Padding bên trong
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                children: [
                  Text(
                    "Danh Sách Giỏ Hàng",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics:
                        NeverScrollableScrollPhysics(), // Ngăn cuộn bên trong
                    itemCount: cartItems.length, // Số lượng sản phẩm
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 122, 116, 116),
                                  fontSize: 14),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove_circle_outline),
                                  onPressed: () {
                                    decreaseQuantity(index);
                                  },
                                ),
                                Text(
                                  "${item['quantity']}",
                                  style: TextStyle(fontSize: 13),
                                ),
                                IconButton(
                                  icon: Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    increaseQuantity(index);
                                  },
                                ),
                              ],
                            ),
                            Text(
                              "${NumberFormat.currency(
                                locale: 'vi_VN',
                                symbol: 'đ',
                                decimalDigits: 0,
                              ).format(item['price'] * item['quantity'])}",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 122, 116, 116),
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            //Thông tin thanh toán
            Container(
              margin: EdgeInsets.fromLTRB(6, 12, 6, 6),
              padding: EdgeInsets.all(8), // Padding bên trong
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                children: [
                  Text(
                    "Thông Tin Thanh Toán",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tiền hàng",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 134, 128, 128),
                            fontSize: 13),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'vi_VN',
                          symbol: 'đ',
                          decimalDigits: 0,
                        ).format(400000),
                        style: TextStyle(
                            color: const Color.fromARGB(255, 134, 128, 128),
                            fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Phía giao hàng, phụ phí",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 134, 128, 128),
                            fontSize: 13),
                      ),
                      Text(
                        "Miễn Phí",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 134, 128, 128),
                            fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tổng đơn hàng",
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'vi_VN',
                          symbol: 'đ',
                          decimalDigits: 0,
                        ).format(400000),
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape:
            CircularNotchedRectangle(), // Tùy chọn notch nếu có FloatingActionButton
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 30, 147, 44), // Giữ màu nền xanh lá
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Đặt hàng ngay",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // Màu chữ trắng, đảm bảo tương phản
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
