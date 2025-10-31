import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:norticeboard/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserManagementService extends ChangeNotifier {
  List<UserModel> _usersList = [];
  List<UserModel> get usersList => _usersList;

  UserManagementService() {
    fetchUsers();
  }

  bool isLoading = false;

  final String baseUrl = "https://noticebord.onrender.com";
  Future<void> fetchUsers() async {
    isLoading = true;
    try {
      final http.Response response = await http.get(
        Uri.parse('$baseUrl/api/users/get_all-users'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["data"];

        _usersList = data.map((item) => UserModel.fromMap(item)).toList();

        isLoading = false;
        notifyListeners();
      } else {
        print('Failed to load users');
        isLoading = false;
      }
    } catch (e) {
      isLoading = false;
      print(e.toString());
    }
  }

  Future<void> deleteUser(String id, BuildContext ctx) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      String token = pref.getString("token") ?? "";
      if (token == "") {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text('Authentication token not found')),
        );
        return;
      }
      final response = await http.delete(
        Uri.parse('$baseUrl/api/users/delete-user/$id'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text('User deleted successfully')),
        );
        fetchUsers();
      } else {
        final message = jsonDecode(response.body)["message"];
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text("$message")));
      }
    } catch (e) {
      print(e);
    }
  }
}
