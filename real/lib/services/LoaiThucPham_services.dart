import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real/models/Loaithucpham_model.dart';

class LoaiThucPhamService {
  final String baseUrl = 'http://10.0.2.2:5208/api';
  Future<List<Loaithucpham>> fetchLoaiThucPham() async {
    final response = await http.get(Uri.parse('$baseUrl/LoaiThucPham'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      final List<dynamic> results = jsonData['results'];
      return results.map((json) => Loaithucpham.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load loai thuc pham');
    }
  }
}
