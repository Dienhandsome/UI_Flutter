// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:real/screen/DangNhap.dart';

import 'package:real/screen/cart/cart_screen.dart';
import 'package:real/screen/cart/listCart_screen.dart';
import 'package:real/screen/checkout_screen.dart';
import 'package:real/screen/custom_bottom_bar.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //debugShowCheckedModeBanner: false,
      home: CheckOutScreen(),
    );
  }
}
