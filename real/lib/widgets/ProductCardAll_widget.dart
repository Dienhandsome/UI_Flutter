import 'package:flutter/material.dart';
import 'package:real/models/Cart_model.dart';
import 'package:real/models/Thucpham_model.dart';
import 'package:real/provider/cart_provider.dart';
import '../models/GroupThucPham_model.dart';

class ProductCardAllWidget extends StatelessWidget {
  final Thucpham thucpham;
  final Aprovider cartProvider;

  const ProductCardAllWidget({
    Key? key,
    required this.thucpham,
    required this.cartProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
              child: Image.network(
                thucpham.image.toString(),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  thucpham.tenThucPham.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${thucpham.giaBan}đ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
              color: Colors.green[50],
            ),
            child: ElevatedButton(
              onPressed: () {
                try {
                  cartProvider.addToCart(CartItem(
                      productId: thucpham.iDThucPham ?? 0,
                      name: thucpham.tenThucPham ?? "",
                      price: (thucpham.giaBan ?? 0).toDouble(),
                      urlImage: thucpham.image ?? ""));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Đã thêm vào giỏ hàng'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Không thể thêm vào giỏ hàng'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: const Color.fromARGB(255, 64, 115, 28),
                foregroundColor: const Color.fromARGB(255, 235, 238, 233),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(8)),
                ),
              ),
              child: Text(
                'MUA',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
