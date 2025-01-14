import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:real/helpers/auth_helper.dart';
import 'package:real/models/Cart_model.dart';
import 'package:real/provider/cart_provider.dart';
import 'package:real/services/Cart_service.dart';
import '../models/GroupThucPham_model.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  final Aprovider cartProvider;

  ProductCardWidget(
      {Key? key, required this.product, required this.cartProvider})
      : super(key: key);

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
                product.image.toString(),
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
                  product.tenThucPham.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(NumberFormat.currency(
                      locale: 'vi_VN',
                      symbol: 'đ',
                      decimalDigits: 0,
                    ).format(product.giaBan)),
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
              onPressed: () async {
                final isAuthenticated =
                    await AuthHelper.checkAuthAndNavigate(context);
                if (isAuthenticated) {
                  try {
                    cartProvider.addToCart(CartItem(
                        productId: product.iDThucPham ?? 0,
                        name: product.tenThucPham ?? "",
                        price: (product.giaBan ?? 0).toDouble(),
                        urlImage: product.image ?? ""));
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
