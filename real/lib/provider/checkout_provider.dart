import 'package:flutter/material.dart';
import 'package:real/shared_pereferences/ThongTinGiaoHang.dart';

class CheckoutProvider with ChangeNotifier {
  String _hoTen = '';
  String _soDienThoai = '';
  String _diaChi = '';
  String _ghiChu = '';

  // Getters
  String get hoTen => _hoTen;
  String get soDienThoai => _soDienThoai;
  String get diaChi => _diaChi;
  String get ghiChu => _ghiChu;

  final ThongtingiaohangShared _sharedPrefs = ThongtingiaohangShared();

  // Setters
  void updateHoTen(String value) {
    _hoTen = value;
    notifyListeners();
  }

  void updateSoDienThoai(String value) {
    _soDienThoai = value;
    notifyListeners();
  }

  void updateDiaChi(String value) {
    _diaChi = value;
    notifyListeners();
  }

  void updateGhiChu(String value) {
    _ghiChu = value;
    notifyListeners();
  }

  // Load dữ liệu từ SharedPreferences
  Future<void> loadFromSharedPreferences() async {
    final data = await _sharedPrefs.getCheckoutInfo();
    if (data != null) {
      _hoTen = data['name'] ?? '';
      _soDienThoai = data['phone'] ?? '';
      _diaChi = data['address'] ?? '';
      _ghiChu = data['note'] ?? '';
    }
    notifyListeners();
  }

  // Save dữ liệu vào SharedPreferences
  Future<void> saveToSharedPreferences() async {
    await _sharedPrefs.saveCheckoutInfo(_diaChi, _hoTen, _soDienThoai, _ghiChu);
  }
}
