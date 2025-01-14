import 'package:flutter/material.dart';
import 'package:real/screen/DangNhap.dart';
import 'package:real/screen/custom_bottom_bar.dart';
import 'package:real/services/token_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final TokenService _tokenService = TokenService();

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    try {
      // Đợi 2 giây để hiển thị splash screen
      await Future.delayed(Duration(seconds: 2));

      // Kiểm tra token
      final token = await _tokenService.getAccessToken();

      if (mounted) {
        if (token != null && token.isNotEmpty) {
          // Có token hợp lệ -> Chuyển đến màn hình chính
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => CustomBottomBar()),
          );
        } else {
          // Không có token -> Chuyển đến màn hình đăng nhập
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => SignIn()),
          );
        }
      }
    } catch (e) {
      print('Error checking token: $e');
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => SignIn()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 46, 121, 49),
              Colors.green[500]!,
              Color.fromARGB(255, 24, 172, 100),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading indicator
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'Đang tải...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
