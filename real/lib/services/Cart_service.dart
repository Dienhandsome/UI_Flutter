import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/GroupThucPham_model.dart';

class CartService {
  static const String cartKey = 'cart';
  //Tạo giỏ hàng
  Future<void> addToCart(Product product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> cart = prefs.getStringList(cartKey) ?? [];
      cart.add(json.encode(product.toJson()));
      await prefs.setStringList(cartKey, cart);
    } catch (e) {
      throw Exception('Failed to add to cart: $e');
    }
  }

  //Lấy giỏ hàng
  Future<List<Product>> getCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> cart = prefs.getStringList(cartKey) ?? [];

      // Chuyển đổi danh sách JSON thành danh sách đối tượng Product
      return cart.map((item) {
        Map<String, dynamic> json = jsonDecode(item); // Decode chuỗi JSON
        return Product.fromJson(json); // Tạo đối tượng Product
      }).toList();
    } catch (e) {
      throw Exception('Failed to load cart: $e');
    }
  }

  //Update Sản Phẩm
  Future<void> updateCart(Product product) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> cart = prefs.getStringList(cartKey) ?? [];

      // Tìm sản phẩm cần cập nhật trong danh sách
      for (int i = 0; i < cart.length; i++) {
        Map<String, dynamic> item = json.decode(cart[i]);
        if (item['iDThucPham'] == product.iDThucPham) {
          // So sánh dựa trên tên hoặc ID sản phẩm
          cart[i] = json.encode(product.toJson()); // Thay thế sản phẩm
          break;
        }
      }

      await prefs.setStringList(cartKey, cart); // Lưu lại danh sách đã cập nhật
    } catch (e) {
      throw Exception('Failed to update cart: $e');
    }
  }

  //Xóa gỉỏ hàng
  Future<void> removeFromCart(int iDThucPham) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> cart = prefs.getStringList(cartKey) ?? [];

      // Loại bỏ sản phẩm dựa trên tên (hoặc ID nếu bạn lưu ID)
      cart.removeWhere((item) {
        Map<String, dynamic> product = json.decode(item);
        return product['iDThucPham'] == iDThucPham;
      });

      await prefs.setStringList(cartKey, cart); // Lưu danh sách sau khi xóa
    } catch (e) {
      throw Exception('Failed to remove from cart: $e');
    }
  }
}
