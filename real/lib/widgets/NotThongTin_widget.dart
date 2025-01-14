// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class NoThongTinWidget extends StatelessWidget {
  final VoidCallback onAdd; // Hàm callback khi người dùng nhấn "Nhập thông tin"

  const NoThongTinWidget({required this.onAdd, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 224, 145, 26).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Text(
                "Nhập thông tin nhận hàng",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            onPressed: onAdd, // Gọi hàm callback
            icon: Icon(Icons.arrow_forward_ios, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
