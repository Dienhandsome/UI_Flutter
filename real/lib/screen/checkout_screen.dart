import 'package:flutter/material.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

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
            title: Text("Thông Tin Nhận Hàng", style: TextStyle(fontSize: 22)),
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
              margin: EdgeInsets.fromLTRB(6, 15, 6, 6),
              padding: EdgeInsets.all(15), // Padding bên trong
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Căn chỉnh nội dung dọc
                children: [
                  TextFormField(
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      labelText: "Họ và tên",
                      labelStyle: TextStyle(fontSize: 13),
                      hintText: "Nhập họ và tên",
                      hintStyle: TextStyle(fontSize: 13),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      labelText: "Số Điện Thoại",
                      labelStyle: TextStyle(fontSize: 13),
                      hintText: "Nhập số điện thoại",
                      hintStyle: TextStyle(fontSize: 13),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      labelText: "Địa Chỉ",
                      labelStyle: TextStyle(fontSize: 13),
                      hintText: "Nhập Địa Chỉ",
                      hintStyle: TextStyle(fontSize: 13),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                    style: TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      labelText: "Ghi Chú",
                      labelStyle: TextStyle(fontSize: 13),
                      hintText: "Nhập ghi chú",
                      hintStyle: TextStyle(fontSize: 13),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 30, 147, 44),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
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
                        255, 50, 160, 63), // Giữ màu nền xanh lá
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Xác Nhận",
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
