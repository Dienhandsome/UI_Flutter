// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:real/services/user_service.dart';

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
  final UserService _userService = UserService();
  bool _isLoading = false;
  String? _initialHoTen;
  String? _initialSdt;

  @override
  void initState() {
    super.initState();
    _initialHoTen = widget.hoTen;
    _initialSdt = widget.sdt;
    _hoTenController = TextEditingController(text: _initialHoTen);
    _sdtController = TextEditingController(text: _initialSdt);

    // Thêm listeners để cập nhật UI khi có thay đổi
    _hoTenController.addListener(_onTextChanged);
    _sdtController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _hoTenController.removeListener(_onTextChanged);
    _sdtController.removeListener(_onTextChanged);
    _hoTenController.dispose();
    _sdtController.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    setState(() {}); // Trigger rebuild để cập nhật trạng thái nút
  }

  bool get _hasChanges {
    return (_hoTenController.text.trim() != _initialHoTen?.trim()) ||
        (_sdtController.text.trim() != _initialSdt?.trim());
  }

  bool get _isValid {
    return _hoTenController.text.trim().isNotEmpty &&
        _sdtController.text.trim().isNotEmpty;
  }

  Future<bool> _onWillPop() async {
    if (_hasChanges) {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Xác nhận'),
              content: Text(
                  'Bạn có thay đổi chưa được lưu. Bạn có muốn thoát không?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Ở lại'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('Thoát'),
                ),
              ],
            ),
          ) ??
          false;
    }
    return true;
  }

  Future<void> _updateProfile() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final response = await _userService.updateProfile(
        fullName: _hoTenController.text,
        phoneNumber: _sdtController.text,
      );

      if (response != null) {
        await Future.delayed(Duration(milliseconds: 500));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Cập nhật thông tin thành công'),
            backgroundColor: Colors.green,
          ),
        );

        if (mounted) {
          Navigator.pop(context, {
            'hoTen': _hoTenController.text,
            'sdt': _sdtController.text,
            'updated': true,
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi cập nhật: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(54.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(28.0),
              bottomRight: Radius.circular(28.0),
            ),
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: const Color.fromARGB(255, 39, 38, 38)),
                padding: EdgeInsets.only(left: 10),
                iconSize: 20,
                onPressed: () async {
                  if (await _onWillPop()) {
                    Navigator.of(context).pop();
                  }
                },
              ),
              title:
                  Text("Sửa thông tin cá nhân", style: TextStyle(fontSize: 22)),
              centerTitle: true,
              elevation: 0.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 46, 121, 49),
                      Colors.green[500]!,
                      const Color.fromARGB(255, 24, 172, 100),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TextField(
                  controller: _hoTenController,
                  decoration: InputDecoration(
                    labelText: 'Họ và tên',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4CAF50)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person, color: Color(0xFF4CAF50)),
                    hintText: 'Nhập họ và tên của bạn',
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _sdtController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Số điện thoại',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF4CAF50)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone, color: Color(0xFF4CAF50)),
                    hintText: 'Nhập số điện thoại của bạn',
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (_isLoading || !_hasChanges || !_isValid)
                        ? null
                        : _updateProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (_hasChanges && _isValid)
                          ? Color(0xFF4CAF50)
                          : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            'Lưu thông tin',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
