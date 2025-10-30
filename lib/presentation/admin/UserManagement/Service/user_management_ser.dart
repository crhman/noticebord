import 'dart:convert';
import 'package:http/http.dart' as http;

class UserManagementService {
  final String baseUrl = "https://noticebord.onrender.com";
  Future<List<dynamic>> fetchUsers() async {
    // final response = await http.get(
    //   Uri.parse('$baseUrl/api/users/get_all-users'),
    // );
    final http.Response response = await http.get(
      Uri.parse('$baseUrl/api/users/get_all-users'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return data['users'];
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/api/users/get_all-users/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to delete user');
    }
  }
}
