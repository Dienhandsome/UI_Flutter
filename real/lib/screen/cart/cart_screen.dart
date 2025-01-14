// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real/models/GroupThucPham_model.dart';
import 'package:real/provider/cart_provider.dart';
import 'package:real/services/Cart_service.dart';
import 'package:real/widgets/Quanlity_widget.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    final appProvider = Provider.of<Aprovider>(context, listen: false);
    appProvider.loadCartFromSharedPreferences();
    // appProvider.updateCartItems(appProvider.cartItems);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appProvider.loadCartFromSharedPreferences();
    });
  }

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<Aprovider>(context);
    final cartItems = appProvider.cartItems;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.0), // Chiều cao của AppBar
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
              iconSize: 22,
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("Giỏ Hàng", style: TextStyle(fontSize: 26)),
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
      body: Container(
        child: SingleChildScrollView(
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
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 34, 121, 25)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                  children: [
                    Text(
                      "Giao đến",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(height: 4), // Khoảng cách nhỏ giữa các phần
                    Text(
                      "14/8 đường số 4 , Phường Hiệp Bình Phước (Q.Thủ Đức, TP.HCM)",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 122, 116, 116),
                          fontSize: 16),
                    ),
                    Text(
                      "Chị Đạt, 012345678",
                      style: TextStyle(
                          color: const Color.fromARGB(255, 122, 116, 116),
                          fontSize: 16),
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

              //Danh sách giỏ hàng
              Container(
                margin: EdgeInsets.fromLTRB(6, 12, 6, 6),
                padding: EdgeInsets.all(8), // Padding bên trong
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 34, 121, 25)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                  children: [
                    Text(
                      "Danh Sách Giỏ Hàng",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics:
                          NeverScrollableScrollPhysics(), // Ngăn cuộn bên trong
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return QuanlityWidget(productId: item.productId);
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
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 34, 121, 25)
                          .withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                  children: [
                    Text(
                      "Thông Tin Thanh Toán",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tiền hàng",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 134, 128, 128),
                              fontSize: 16),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: 'đ',
                            decimalDigits: 0,
                          ).format(appProvider.calculateTotalPrice * 0.001),
                          style: TextStyle(
                              color: const Color.fromARGB(255, 134, 128, 128),
                              fontSize: 16),
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
                              fontSize: 16),
                        ),
                        Text(
                          "Miễn Phí",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 134, 128, 128),
                              fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tổng đơn hàng",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi_VN',
                            symbol: 'đ',
                            decimalDigits: 0,
                          ).format(appProvider.calculateTotalPrice * 0.001),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
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
      ),
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(500), // Đặt chiều cao mong muốn
        child: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 250, // Đặt chiều cao phù hợp với PreferredSize
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50, // Chiều cao của nút
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 201, 220, 34),
                          Color.fromARGB(255, 15, 79, 9),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Đặt hàng ngay",
                      style: TextStyle(
                        fontSize: 20, // Font chữ lớn hơn
                        color: Colors.white, // Màu chữ trắng
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
