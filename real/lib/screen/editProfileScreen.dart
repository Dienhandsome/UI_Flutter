// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String hoTen;
  final String sdt;

  const EditProfileScreen({
    Key? key,
    required this.hoTen,
    required this.sdt,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _hoTenController;
  late TextEditingController _sdtController;
  String _selectedGender = 'Nam'; // Giá trị mặc định

  @override
  void initState() {
    super.initState();
    _hoTenController = TextEditingController(text: widget.hoTen);
    _sdtController = TextEditingController(text: widget.sdt);
  }

  @override
  void dispose() {
    _hoTenController.dispose();
    _sdtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sửa thông tin cá nhân'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Giới tính',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Nam',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                    activeColor: Color(0xFF4CAF50),
                  ),
                  Text('Nam'),
                  SizedBox(width: 20),
                  Radio<String>(
                    value: 'Nữ',
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value!;
                      });
                    },
                    activeColor: Color(0xFF4CAF50),
                  ),
                  Text('Nữ'),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: _hoTenController,
                decoration: InputDecoration(
                  labelText: 'Họ và tên',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4CAF50)),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sdtController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Số điện thoại',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF4CAF50)),
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý lưu thông tin
                    Navigator.pop(context, {
                      'hoTen': _hoTenController.text,
                      'sdt': _sdtController.text,
                      'gender': _selectedGender,
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4CAF50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Lưu thông tin',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
