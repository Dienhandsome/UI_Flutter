// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:real/provider/cart_provider.dart';

class QuanlityWidget extends StatelessWidget {
  final int productId;
  const QuanlityWidget({super.key, required this.productId});

  @override
  @override
  Widget build(BuildContext context) {
    return Consumer<Aprovider>(
      builder: (context, appProvider, child) {
        final item = appProvider.cartItems
            .firstWhere((item) => item.productId == productId);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              // Product name - left aligned
              Expanded(
                flex: 2,
                child: Text(
                  item.name ?? '',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 122, 116, 116),
                    fontSize: 16,
                  ),
                ),
              ),
              // Quantity - center aligned
              Expanded(
                flex: 1,
                child: Center(
                  child: Container(
                    width: 60,
                    height: 30,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      controller:
                          TextEditingController(text: item.quantity.toString()),
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                          int? newQuantity = int.tryParse(value);
                          if (newQuantity != null && newQuantity > 0) {
                            appProvider.updateCartItemQuantity(
                                item.productId, newQuantity);
                          }
                        }
                      },
                    ),
                  ),
                ),
              ),
              // Price - right aligned
              Expanded(
                flex: 2,
                child: Text(
                  "${NumberFormat.currency(
                    locale: 'vi_VN',
                    symbol: 'đ',
                    decimalDigits: 0,
                  ).format((item.price ?? 0) * 0.001 * double.parse(item.quantity.toString()))}",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 122, 116, 116),
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
