import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<UsersResponse> getUsers({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users?page=$page&per_page=$perPage'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        return UsersResponse.fromJson(jsonData);
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  static Future<List<User>> getUsersSimple({
    int page = 1,
    int perPage = 10,
  }) async {
    final response = await getUsers(page: page, perPage: perPage);
    return response.data;
  }
}
