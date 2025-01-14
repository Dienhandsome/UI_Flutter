// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real/models/user_model.dart';
import 'package:real/screen/DangNhap.dart';
import 'package:real/screen/ShipingAddress.dart';
import 'package:real/screen/editProfileScreen.dart';
import 'package:real/screen/quenmatkhau.dart';
import 'package:real/services/user_service.dart';
import 'package:real/services/token_service.dart';

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
  final UserService _userService = UserService();
  final TokenService _tokenService = TokenService();
  User? _user;
  late String _hoTen;
  late String _sdt;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _hoTen = widget.hoTen;
    _sdt = widget.sdt;
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final user = await _userService.getUserProfile();
      setState(() {
        _user = user;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading profile: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _navigateToEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          hoTen: _user?.fullName ?? '',
          sdt: _user?.phoneNumber ?? '',
        ),
      ),
    );

    if (result != null && result['updated'] == true) {
      await _loadUserProfile();
      setState(() {
        _hoTen = _user?.fullName ?? '';
        _sdt = _user?.phoneNumber ?? '';
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

  Future<void> _handleLogout() async {
    await _tokenService.deleteTokens();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
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
                      "https://scontent.fsgn8-4.fna.fbcdn.net/v/t39.30808-1/426563325_1510109033103723_6688801785968523102_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=101&ccb=1-7&_nc_sid=e99d92&_nc_ohc=6g1f21RMs8QQ7kNvgEJ0ntm&_nc_oc=AdjAzDGwx-AmDHwYP5R2e5aYIrPZEnRJHxCOkkda00xPC2YX3qOMPxvpq_YLxe1zwj2mgYsaiK5usYb2TYek41rd&_nc_zt=24&_nc_ht=scontent.fsgn8-4.fna&_nc_gid=AD8bKDhbH_nT2BEbP-ZfL3d&oh=00_AYBweurvQRSTR56HERFQTpcQttUeyOC4Z3DrvxsaWbfjHQ&oe=678C569C",
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
              Center(
                child: Column(
                  children: [
                    _buildInfoRow('Họ tên', _user?.fullName ?? ''),
                    _buildInfoRow('Email', _user?.email ?? ''),
                    _buildInfoRow('Số điện thoại', _user?.phoneNumber ?? ''),
                    _buildInfoRow('Địa chỉ', _user?.address ?? ''),
                  ],
                ),
              ),
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextButton(
                onPressed: _handleLogout,
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
