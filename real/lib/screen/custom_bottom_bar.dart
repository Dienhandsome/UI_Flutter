// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:real/screen/ShipingAddress.dart';
import 'package:real/screen/dangky.dart';
import 'package:real/screen/editProfileScreen.dart';

import 'package:real/screen/home_screen.dart';
import 'package:real/screen/profile_screen.dart';
import 'package:real/screen/quenmatkhau.dart';
import 'package:real/screen/suggest_screen.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({Key? key}) : super(key: key);

  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreens()[_selectedIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        // backgroundColor:  const Color.fromARGB(255, 127, 221, 145),
        backgroundColor: Color.fromARGB(255, 94, 133, 22), // Màu xanh lá cây chính
        items: _navBarsItems(),
        activeColor:
            const Color.fromARGB(255, 24, 26, 24), // Màu active mặc định
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  /// Danh sách các màn hình tương ứng với mỗi tab
  List<Widget> _buildScreens() {
    return [
      HomeScreen(), // Màn hình Home
      SuggestScreen(),
      ProfileScreen(
        hoTen: '',
        email: '',
        sdt: '',
      ), // Màn hình Profile
      LoginRegistrationScreen(),
      ShippingAddressScreen(),
      quenmatkhau(),
      EditProfileScreen(
        hoTen: '',
        sdt: '',
      ),
    ];
  }

  /// Danh sách các mục trong Navigation Bar
  List<TabItem> _navBarsItems() {
    return [
      TabItem(
        icon: Icons.category_rounded,
        title: "Sản phẩm",
        //activeIcon: Icon(Icons.home, color: Colors.purple),
      ),
      TabItem(
        icon: Icons.auto_awesome,
        title: "Gợi ý",
        //activeIcon: Icon(Icons.shopping_bag, color: Colors.pinkAccent),
      ),
      TabItem(
        icon: Icons.person_2_outlined,
        title: "Tài khoản",
        activeIcon: Icon(Icons.person, color: Colors.deepOrange),
      ),
    ];
  }
}
