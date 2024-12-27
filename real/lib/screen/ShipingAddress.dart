// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShippingAddressScreen extends StatefulWidget {
  final String? currentAddress;

  const ShippingAddressScreen({Key? key, this.currentAddress})
      : super(key: key);

  @override
  _ShippingAddressScreenState createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  late TextEditingController _addressController;
  late TextEditingController _cityController;
  late TextEditingController _districtController;
  late TextEditingController _wardController;

  @override
  void initState() {
    super.initState();
    _addressController = TextEditingController(text: widget.currentAddress);
    _cityController = TextEditingController();
    _districtController = TextEditingController();
    _wardController = TextEditingController();
  }

  @override
  void dispose() {
    _addressController.dispose();
    _cityController.dispose();
    _districtController.dispose();
    _wardController.dispose();
    super.dispose();
  }

  void _saveAddress() {
    // Tạo một đối tượng địa chỉ hoàn chỉnh
    final fullAddress = {
      'street': _addressController.text,
      'city': _cityController.text,
      'district': _districtController.text,
      'ward': _wardController.text,
    };

    // Trả về kết quả cho màn hình trước
    Navigator.pop(context, fullAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Địa chỉ giao hàng'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Chi tiết địa chỉ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        controller: _addressController,
                        decoration: InputDecoration(
                          labelText: 'Số nhà, Tên đường',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.home),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _wardController,
                        decoration: InputDecoration(
                          labelText: 'Phường/Xã',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_city),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _districtController,
                        decoration: InputDecoration(
                          labelText: 'Quận/Huyện',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_on),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: _cityController,
                        decoration: InputDecoration(
                          labelText: 'Tỉnh/Thành phố',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.location_city),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveAddress,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Color(0xFF81C408),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Lưu địa chỉ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
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
