// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/provider/checkout_provider.dart';
import 'package:real/screen/cart/cart_screen.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy dữ liệu từ Provider
    final provider = Provider.of<CheckoutProvider>(context);

    // Khởi tạo controllers với dữ liệu từ Provider
    final hoTenController = TextEditingController(text: provider.hoTen);
    final soDienThoaiController =
        TextEditingController(text: provider.soDienThoai);
    final diaChiController = TextEditingController(text: provider.diaChi);
    final ghiChuController = TextEditingController(text: provider.ghiChu);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(54.0),
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
              iconSize: 23,
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("Thông Tin Nhận Hàng", style: TextStyle(fontSize: 25)),
            centerTitle: true,
            elevation: 0.0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 46, 121, 49)!,
                    Colors.green[500]!,
                    const Color.fromARGB(255, 24, 172, 100)!,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(6, 15, 6, 6),
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: hoTenController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: "Họ và tên",
                      labelStyle: TextStyle(fontSize: 16),
                      hintText: "Nhập họ và tên",
                      hintStyle: TextStyle(fontSize: 16),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: soDienThoaiController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: "Số Điện Thoại",
                      labelStyle: TextStyle(fontSize: 16),
                      hintText: "Nhập số điện thoại",
                      hintStyle: TextStyle(fontSize: 16),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: diaChiController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: "Địa Chỉ",
                      labelStyle: TextStyle(fontSize: 16),
                      hintText: "Nhập Địa Chỉ",
                      hintStyle: TextStyle(fontSize: 16),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: ghiChuController,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      labelText: "Ghi Chú",
                      labelStyle: TextStyle(fontSize: 16),
                      hintText: "Nhập ghi chú",
                      hintStyle: TextStyle(fontSize: 16),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 129, 131, 4),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Cập nhật dữ liệu vào Provider
                        provider.updateHoTen(hoTenController.text);
                        provider.updateSoDienThoai(soDienThoaiController.text);
                        provider.updateDiaChi(diaChiController.text);
                        provider.updateGhiChu(ghiChuController.text);

                        // Lưu dữ liệu vào SharedPreferences
                        await provider.saveToSharedPreferences();

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Thông tin đã được lưu!")),
                        );

                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(250, 40), // Chiều rộng và chiều cao
                        backgroundColor:
                            Color.fromARGB(255, 62, 150, 72), // Màu nền
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), // Bo góc nút
                        ),
                        elevation: 5, // Độ nổi của nút
                      ),
                      child: Text(
                        "Xác Nhận",
                        style: TextStyle(
                          fontSize: 18, // Kích thước chữ
                          fontWeight: FontWeight.bold, // Độ đậm của chữ
                          color: Colors.white, // Màu chữ
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
