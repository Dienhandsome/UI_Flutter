// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String imageUrl;

  Product({required this.name, required this.price, required this.imageUrl});
}
//  final List<Product> products = [
//     Product(name: 'Sản phẩm 1', price: 10, imageUrl: 'https://via.placeholder.com/150'),
//     Product(name: 'Sản phẩm 2', price: 20, imageUrl: 'https://via.placeholder.com/150'),
//     Product(name: 'Sản phẩm 3', price: 30, imageUrl: 'https://via.placeholder.com/150'),
//     Product(name: 'Sản phẩm 4', price: 40, imageUrl: 'https://via.placeholder.com/150'),
//     Product(name: 'Sản phẩm 5', price: 50, imageUrl: 'https://via.placeholder.com/150'),
//     Product(name: 'Sản phẩm 6', price: 60, imageUrl: 'https://via.placeholder.com/150'),
//   ];

class ProductListScreen extends StatelessWidget {

   final List<Product> products;



  ProductListScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Hiển thị 2 sản phẩm trên 1 hàng
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
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
                        // Xử lý logic khi nhấn nút "Buy"
                      },
                      child: Text(
                        'Buy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang chủ'),
      ),
    );
  }
