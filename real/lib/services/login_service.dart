import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  // Change localhost to your machine's IP address for mobile devices
  final String baseURI = 'http://10.0.2.2:5208'; // For Android emulator
  // or use 'http://localhost:5208' for web testing

  Future<Map<String, dynamic>?> login(String email, String password) async {
    try {
      final url = Uri.parse('$baseURI/login');
      print('Attempting to connect to: $url'); // Debug log

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );

      print('Response status: ${response.statusCode}'); // Debug log
      print('Response body: ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        // Check if response contains the expected structure
        if (responseBody['status'] == 'true' &&
            responseBody.containsKey('result')) {
          final result = responseBody['result'];
          final accessToken = result['accessToken'];
          final refreshToken = result['refreshToken'];

          if (accessToken != null && refreshToken != null) {
            return {'accessToken': accessToken, 'refreshToken': refreshToken};
          } else {
            throw Exception('Tokens are null');
          }
        } else {
          throw Exception('Invalid login response format');
        }
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      print('Connection error: $e'); // Debug log
      throw Exception('Connection failed: $e');
    }
  }
}
