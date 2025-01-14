import 'package:http/http.dart' as http;
import 'package:real/models/CT_HoaDon.dart';
import 'package:real/models/Cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class OrderService {
  final String baseUrl = 'http://10.0.2.2:5208/api';

  Future<bool> createOrder(List<CartItem> items) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('access_Token');

      final ct_hoadon = items
          .map((x) => CT_HoaDon(
              iDThucPham: x.productId,
              tenThucPham: x.name,
              soLuong: x.quantity,
              donGia: x.price!.toInt()))
          .toList();
      if (token == null) {
        throw Exception('No token found');
      }

      final response = await http.post(
        Uri.parse('$baseUrl/CT_HoaDon/CreateGioHang'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(ct_hoadon),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Failed to create order');
      }
    } catch (e) {
      print('Error creating order: $e');
      return false;
    }
  }
}
