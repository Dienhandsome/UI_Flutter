import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ThongtingiaohangShared {
  //Hàm lưu
  Future<void> saveCheckoutInfo(
      String address, String name, String phone, String note) async {
    final prefs = await SharedPreferences.getInstance();

    // Tạo một Map để lưu trữ thông tin
    Map<String, String> checkoutInfo = {
      'address': address,
      'name': name,
      'phone': phone,
      'note': note,
    };

    // Chuyển Map thành chuỗi JSON và lưu vào SharedPreferences
    prefs.setString('keycheckout', jsonEncode(checkoutInfo));
  }

  //Hàm lấy
  Future<Map<String, String>?> getCheckoutInfo() async {
    final prefs = await SharedPreferences.getInstance();
    String? checkoutData = prefs.getString('keycheckout');

    if (checkoutData != null) {
      // Nếu có dữ liệu, chuyển từ JSON sang Map
      return Map<String, String>.from(jsonDecode(checkoutData));
    } else {
      return null; // Nếu không có dữ liệu
    }
  }

  //Hàm xóa
  Future<void> removeCheckoutInfo() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('keycheckout');
  }
}
