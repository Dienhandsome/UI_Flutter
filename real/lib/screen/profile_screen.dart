// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real/screen/DangNhap.dart';
import 'package:real/screen/ShipingAddress.dart';
import 'package:real/screen/editProfileScreen.dart';
import 'package:real/screen/quenmatkhau.dart';

class ProfileScreen extends StatefulWidget {
  final String hoTen;
  final String email;
  final String sdt;

  const ProfileScreen(
      {super.key, required this.hoTen, required this.email, required this.sdt});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _hoTen;
  late String _sdt;

  @override
  void initState() {
    super.initState();
    _hoTen = widget.hoTen;
    _sdt = widget.sdt;
  }

  void _navigateToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          hoTen: _hoTen,
          sdt: _sdt,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _hoTen = result['hoTen'];
        _sdt = result['sdt'];
      });
    }
  }

  void _navigateToShippingAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShippingAddressScreen(),
      ),
    );
  }

  void _navigateToForgotPassword() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => quenmatkhau(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF4CAF50),
        title: Text(
          'Hồ Sơ Cá Nhân',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Avatar
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT73vDfNnuj1CmjAq9XMTWFGQdsZKR2uw-wkg&s",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _navigateToEditProfile,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 18,
                        child: Icon(Icons.edit, color: Color(0xFF81C408)),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Name and Info
              Text(
                _hoTen,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Email: lebaothienbiti@gmail.com ${widget.email}",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              Text(
                "SĐT: 0865340630 $_sdt",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              SizedBox(height: 20),
              // Options Card
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0.0,
                      vertical: 4.0), // Điều chỉnh padding để sát vào viền
                  child: Column(
                    children: [
                      _buildOption(
                        icon: Icons.person,
                        title: 'Sửa thông tin cá nhân',
                        onTap: _navigateToEditProfile,
                      ),
                      Divider(),
                      _buildOption(
                        icon: Icons.location_on,
                        title: 'Địa chỉ giao hàng',
                        onTap: _navigateToShippingAddress,
                      ),
                      Divider(),
                      _buildOption(
                        icon: Icons.lock,
                        title: 'Quên mật khẩu',
                        onTap: _navigateToForgotPassword,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SignIn()), // Điều hướng đến màn hình đăng nhập
                  );
                },
                child: Text(
                  'Đăng xuất',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption(
      {required IconData icon,
      required String title,
      required Function() onTap}) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF4CAF50),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
