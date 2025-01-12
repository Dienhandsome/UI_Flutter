import 'dart:convert';
import 'package:http/http.dart' as http;

class SignUpService {
  final String baseUrl = 'http://10.0.2.2:5208';
  Future<Map<String, dynamic>?> signup(
      String fullName,
      String userName,
      String email,
      String password,
      String confirmPassword,
      String phoneNumber,
      String address) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "userName": userName,
          "email": email,
          "password": password,
          "confirmPassword": confirmPassword,
          "fullName": fullName,
          "phoneNumber": phoneNumber,
          "address": address
        }),
      );

      if (response.statusCode == 200) {
        print('Signup response: ${response.body}');
        return jsonDecode(response.body);
      } else {
        print('Signup failed with status: ${response.statusCode}');
        print('Error response: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Connection error: $e');
      throw Exception('Connection failed: $e');
    }
  }
}
