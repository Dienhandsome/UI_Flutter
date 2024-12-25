// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, must_be_immutable

import 'package:flutter/material.dart';

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
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Hồ sơ')),
      ),
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXWH_Uk5GhUcs_IXcOtmVodFFYSDVF-blVVw&s",
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.hoTen,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Email: ${widget.email}",
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 45, 66, 226),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "SDT: ${widget.sdt}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 45, 66, 226),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
