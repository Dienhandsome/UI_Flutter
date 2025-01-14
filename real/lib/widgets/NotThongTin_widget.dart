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
                style: TextStyle(color: Colors.orange, fontSize: 16),
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
