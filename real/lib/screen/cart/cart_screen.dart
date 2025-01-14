// ignore_for_file: prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real/helpers/auth_helper.dart';
import 'package:real/models/GroupThucPham_model.dart';
import 'package:real/provider/cart_provider.dart';
import 'package:real/provider/checkout_provider.dart';
import 'package:real/screen/custom_bottom_bar.dart';
import 'package:real/services/Cart_service.dart';
import 'package:real/services/Order_service.dart';
import 'package:real/widgets/CheckInfor_widget.dart';
import 'package:real/widgets/Quanlity_widget.dart';
import 'package:shimmer/shimmer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;

  // Future<void> _checkAuthAndLoadCart() async {
  //   final isAuthenticated = await AuthHelper.checkAuthAndNavigate(context);
  //   if (isAuthenticated) {
  //     await _loadCartItems();
  //   } else {
  //     if (mounted) {
  //       Navigator.pop(context); // Quay lại màn hình trước đó
  //     }
  //   }
  // }

  @override
  void initState() {
    super.initState();
    final appProvider = Provider.of<Aprovider>(context, listen: false);
    appProvider.loadCartFromSharedPreferences();
    final checkoutProvider =
        Provider.of<CheckoutProvider>(context, listen: false);
    checkoutProvider.loadFromSharedPreferences();

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
              onPressed: () {
                Navigator.pop(context);
              },
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
              CheckInforWidget(),

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
        preferredSize: Size.fromHeight(80),
        child: BottomAppBar(
          color: Colors.white,
          child: Container(
            height: 80,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: GestureDetector(
                onTap: () async {
                  final orderService = OrderService();
                  final success = await orderService.createOrder(cartItems);

                  if (success) {
                    // Clear cart after successful order
                    appProvider.clearCart();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đặt hàng thành công'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomBottomBar()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Đặt hàng thất bại'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
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
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
