import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListCartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "Bánh Mì Bơ",
      "price": 40000,
      "quantity": 1,
      "image": "assets/banh_mi_bo.jpg",
    },
    {
      "name": "Cá Basa",
      "price": 35000,
      "quantity": 2,
      "image": "assets/ca_basa.jpg",
    },
    {
      "name": "Ba Rọi Heo Nga",
      "price": 120000,
      "quantity": 1,
      "image": "assets/ba_roi.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cartItems.length, // Số lượng sản phẩm
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return Container(
            margin: EdgeInsets.fromLTRB(6, 0, 6, 0),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Hình ảnh sản phẩm
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                ),
                SizedBox(width: 10),

                // Thông tin sản phẩm
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        NumberFormat.currency(
                          locale: 'vi_VN',
                          symbol: 'đ',
                          decimalDigits: 0,
                        ).format(item['price']),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bộ tăng/giảm số lượng
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        // Xử lý giảm số lượng
                      },
                    ),
                    Text(
                      "${item['quantity']}",
                      style: TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        // Xử lý tăng số lượng
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
