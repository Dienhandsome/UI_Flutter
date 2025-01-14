import 'dart:ui';

import 'package:flutter/material.dart';

class HaveThongTinWidget extends StatelessWidget {
  final Map<String, String> checkoutInfo;
  final VoidCallback onEdit; // Hàm callback khi người dùng nhấn "Đổi thông tin"

  const HaveThongTinWidget({
    required this.checkoutInfo,
    required this.onEdit,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6, 12, 6, 6),
      padding: EdgeInsets.all(8), // Padding bên trong
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 34, 121, 25).withOpacity(0.5),
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
          Text("Giao đến",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 5),
          Text(checkoutInfo['address'] ?? '', style: TextStyle(fontSize: 16)),
          Text(checkoutInfo['name'] ?? '', style: TextStyle(fontSize: 16)),
          Text(checkoutInfo['phone'] ?? '', style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onEdit, // Gọi hàm callback
            child: Text("Đổi thông tin"),
          ),
        ],
      ),
    );
  }
}
