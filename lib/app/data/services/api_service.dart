import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<UsersResponse> getUsers({int page = 1, int perPage = 10}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users?page=$page&per_page=$perPage'),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return UsersResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}