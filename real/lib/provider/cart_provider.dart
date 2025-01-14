import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:real/models/Cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cartKey = "cartKey";

class Aprovider with ChangeNotifier {
  List<CartItem> _cartItems = [];
  List<CartItem> get cartItems => _cartItems;
//Save cart
  Future<void> _saveCartToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItems = await prefs.setStringList(
      cartKey,
      _cartItems.map((item) => jsonEncode(item.toJson())).toList(),
    );

    if (cartItems != null) {
      // cos data
      print("Lưu giỏ hàng vào shartedPreferences thành công");
      for (var item in _cartItems) {
        print(item.toJson());
      }
    } else {
      print("Lưu giỏ hàng vào shartedPreferences thất bại");
    }
  }

  //Add cart
  void addToCart(CartItem item) {
    final existingItem = _cartItems.firstWhere(
      (i) => i.productId == item.productId,
      orElse: () => CartItem(productId: -1, name: "", price: 0, urlImage: ""),
    );
    if (existingItem.productId == -1) {
      _cartItems.add(item);
    } else {
      //Tăng số lượng sản phẩm đã có trong giỏ hàng
      existingItem.quantity++;
    }
    _saveCartToSharedPreferences();
    notifyListeners();
  }

  //Load cart
  Future<void> loadCartFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cartItems = prefs.getStringList('cartKey');
    if (cartItems != null) {
      _cartItems =
          cartItems.map((item) => CartItem.fromJson(jsonDecode(item))).toList();
      print(_cartItems);
      notifyListeners();
    }
  }

  //Update cart
  void updateCartItemQuantity(int productId, int newQuantity) {
    final item = _cartItems.firstWhere((i) => i.productId == productId);
    item.quantity = newQuantity;
    _saveCartToSharedPreferences();
    notifyListeners();
  }

  //remove cart
  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item.productId == productId);
    _saveCartToSharedPreferences();
    notifyListeners();
  }

  //clear cart
  void clearCart() {
    _cartItems.clear();
    _saveCartToSharedPreferences();
    notifyListeners();
  }

  //Tổng Tiền
  double get calculateTotalPrice {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }
}
