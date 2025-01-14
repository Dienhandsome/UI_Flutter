// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real/provider/cart_provider.dart';
import 'package:real/provider/checkout_provider.dart';

import 'package:real/screen/DangNhap.dart';

import 'package:real/screen/cart/cart_screen.dart';
import 'package:real/screen/cart/listCart_screen.dart';
import 'package:real/screen/checkout_screen.dart';
import 'package:real/screen/custom_bottom_bar.dart';
import 'package:real/screen/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Aprovider()),
        ChangeNotifierProvider(create: (_) => CheckoutProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: CustomBottomBar(),
    );
  }
}
