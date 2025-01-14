import 'package:real/models/Thucpham_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TimthucphamService {
  final String baseUrl = 'http://10.0.2.2:5208/api';
  Future<List<Thucpham>> getThucPhamByIDLTP(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/ThucPham/idltp/$id'));
    if (response.statusCode == 200) {
      // Decode JSON trả về
      final Map<String, dynamic> jsonData = jsonDecode(response.body);

      // Trích xuất danh sách từ "result"
      final List<dynamic> results = jsonData['result'];

      // Ánh xạ danh sách thành đối tượng Thucpham
      return results.map((json) => Thucpham.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load all thuc pham');
    }
  }
}
