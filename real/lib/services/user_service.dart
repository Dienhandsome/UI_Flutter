import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real/models/update_user_model.dart';
import 'package:real/models/user_model.dart';
import 'package:real/services/token_service.dart';

class UserService {
  final String baseUrl = 'http://10.0.2.2:5208';
  final TokenService _tokenService = TokenService();

  Future<User?> getUserProfile() async {
    try {
      final token = await _tokenService.getAccessToken();
      final response = await http.get(
        Uri.parse('$baseUrl/get-user-info'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      print("body: ${response.body}");

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return User.fromJson(data);
      }
      return null;
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }

  Future<bool> updateUserInfo(UpdateUserInfo userInfo) async {
    try {
      final token = await _tokenService.getAccessToken();
      final response = await http.put(
        Uri.parse('$baseUrl/update-user-info'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userInfo.toJson()),
      );

      if (response.statusCode == 200) {
        print('Update response: ${response.body}');
        return true;
      }
      return false;
    } catch (e) {
      print('Error updating user info: $e');
      return false;
    }
  }

  Future<dynamic> updateProfile({
    required String fullName,
    required String phoneNumber,
  }) async {
    try {
      final token = await _tokenService.getAccessToken();
      final response = await http.put(
        Uri.parse('$baseUrl/update-user-info'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'fullName': fullName,
          'phoneNumber': phoneNumber,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update profile');
      }
    } catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }
}
