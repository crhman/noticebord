import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:norticeboard/presentation/client/home/screens/home_sceen.dart';
import 'package:norticeboard/presentation/admin/AdminPage/screens/admin_page.dart';
import 'package:norticeboard/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  String baseUrl = "https://noticebord.onrender.com";

  // static Null get currentUser => null;

  Future<void> login({
    required BuildContext ctx,
    required String email,
    required String password,
  }) async {
    try {
      print("calling login api...");
      final http.Response response = await http.post(
        Uri.parse("$baseUrl/api/users/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      );

      print(response.body);

      if (response.statusCode == 200) {
        final role = jsonDecode(response.body)["data"]["role"];
        final token = jsonDecode(response.body)["Token"];
        SharedPreferences pref = await SharedPreferences.getInstance();

        pref.setBool("isLoggedIn", true);
        pref.setString("role", role);
        pref.setString("token", token);

        Map<String, dynamic> data = jsonDecode(response.body)["data"];
        String dataString = jsonEncode(data);
        Provider.of<UserProvider>(ctx, listen: false).setUser(dataString);

        if (role == "admin") {
          Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => AdminPage()),
            (route) => false,
          );
        } else {
          Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => DashboardScreen()),
            (route) => false,
          );
        }

        print(response.body);
      } else {
        final message = jsonDecode(response.body)["message"];
        ScaffoldMessenger.of(
          ctx,
        ).showSnackBar(SnackBar(content: Text("$message")));
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    bool isUserCreated = false;
    try {
      final http.Response response = await http.post(
        Uri.parse("$baseUrl/api/users/create-user"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "name": name,
          "phone": phone,
        }),
      );
      print(response.body);

      if (response.statusCode == 201) {
        isUserCreated = true;
      } else {
        isUserCreated = false;
      }
    } catch (e) {
      print(e.toString());
    }

    return isUserCreated;
  }

  Future<void> logOut(BuildContext contex) async {
    try {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      pref.clear();
      Provider.of<UserProvider>(contex, listen: false).logOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
