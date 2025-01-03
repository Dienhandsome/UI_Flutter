// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:real/screen/DangNhap.dart';
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
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _buildScreens(),
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.titled,
        backgroundColor: Colors.white,
        color: Colors.grey,
        activeColor: Colors.green[700],
        items: _navBarsItems(),
        initialActiveIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }

  /// Danh sách các màn hình tương ứng với mỗi tab
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SuggestScreen(),
      ProfileScreen(
        hoTen: '',
        email: '',
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
        activeIcon: Icon(Icons.category_rounded, size: 30, color: Colors.green),
      ),
      TabItem(
        icon: Icons.auto_awesome,
        title: "Gợi ý",
        activeIcon: Icon(Icons.auto_awesome, size: 30, color: Colors.green),
      ),
      TabItem(
        icon: Icons.person_2_outlined,
        title: "Tài khoản",
        activeIcon: Icon(Icons.person, size: 30, color: Colors.green),
      ),
    ];
  }
}
