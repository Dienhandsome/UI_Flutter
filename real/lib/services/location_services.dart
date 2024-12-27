// services/location_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/location.dart';

class LocationService {
  static const String baseUrl = 'https://provinces.open-api.vn/api';

  // Lấy danh sách tỉnh/thành phố
  Future<List<Province>> getProvinces() async {
    final response = await http.get(Uri.parse('$baseUrl/p/'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Province.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load provinces');
    }
  }

  // Lấy danh sách quận/huyện theo tỉnh/thành
  Future<List<District>> getDistricts(int provinceCode) async {
    final response =
        await http.get(Uri.parse('$baseUrl/p/$provinceCode?depth=2'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> districts = data['districts'];
      return districts.map((json) => District.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load districts');
    }
  }

  // Lấy danh sách phường/xã theo quận/huyện
  Future<List<Ward>> getWards(int districtCode) async {
    final response =
        await http.get(Uri.parse('$baseUrl/d/$districtCode?depth=2'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> wards = data['wards'];
      return wards.map((json) => Ward.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load wards');
    }
  }
}
