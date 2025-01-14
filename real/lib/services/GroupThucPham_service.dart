import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real/models/GroupThucPham_model.dart';

class GroupthucphamService {
  final String baseUrl = 'http://10.0.2.2:5208/api';

  Future<List<GroupThucPham>> fetchGroupThucPham() async {
    final response = await http.get(Uri.parse('$baseUrl/ThucPham/group'));
    if (response.statusCode == 200) {
      // Parse JSON thành đối tượng
      final jsonData = jsonDecode(response.body);

      // Lấy danh sách từ `result` bên trong `results`
      final List<dynamic> resultList = jsonData['results']['result'];

      // Chuyển đổi từng phần tử trong danh sách thành `GroupThucPham`
      return resultList.map((data) => GroupThucPham.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load group thuc pham');
    }
  }
}
