import 'package:flutter/material.dart';
import 'package:real/screen/DangNhap.dart';
import 'package:real/services/token_service.dart';

class AuthHelper {
  static final TokenService _tokenService = TokenService();

  static Future<bool> checkAuthAndNavigate(BuildContext context) async {
    final token = await _tokenService.getAccessToken();

    if (token == null || token.isEmpty) {
      // Hiển thị thông báo
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng đăng nhập để xem giỏ hàng'),
          backgroundColor: Colors.red,
        ),
      );

      // Chuyển hướng đến trang đăng nhập
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
      return false;
    }
    return true;
  }
}
