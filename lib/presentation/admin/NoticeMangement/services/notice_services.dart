import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:norticeboard/model/notice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String baseUrl = "https://noticebord.onrender.com";

class NoticeService extends ChangeNotifier {
  List<Notice> _noticeList = [];
  List<Notice> get noticeList => _noticeList;

  bool isLoading = false;

  NoticeService() {
    getAllNotices();
  }

  Future<void> getAllNotices() async {
    try {
      isLoading = true;
      final url = Uri.parse("$baseUrl/api/notices");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["data"];
        _noticeList = data.map((item) => Notice.fromJson(item)).toList();

        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        print('Failed to fetch notices: ${response.body}');
      }
    } catch (e) {
      isLoading = false;
      print(e);
    }
  }

  // ✅ Get single notice by ID
  static Future<Map<String, dynamic>> getNoticeById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['data'];
    } else {
      throw Exception('Notice not found: ${response.body}');
    }
  }

  // ✅ Create a new notice (Admin)
  void createNotice({
    required String title,
    required String description,
  }) async {
    try {
      String token = await getToken();
      final url = Uri.parse("$baseUrl/api/notices");
      final headers = {
        'Content-Type': 'application/json',
        if (token != "") 'Authorization': 'Bearer $token',
      };

      final body = jsonEncode({'title': title, 'description': description});

      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        await getAllNotices();
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  // ✅ Update notice by ID
  Future<void> updateNotice({
    required String id,
    required String title,
    required String description,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/api/notices/$id');
      String token = await getToken();
      final headers = {
        'Content-Type': 'application/json',
        if (token != "") 'Authorization': 'Bearer $token',
      };

      final body = jsonEncode({
        'title': title.trim(),
        'description': description.trim(),
      });

      final response = await http.put(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        getAllNotices();
      } else {
        print('Failed to update notice: ${response.body}');
      }
    } catch (e) {
      print(e);
    }
  }

  // ✅ Delete notice by ID (Admin)
  void deleteNotice(String id) async {
    try {
      String token = await getToken();

      final url = Uri.parse('$baseUrl/api/notices/$id');

      final headers = {
        'Content-Type': 'application/json',
        if (token != "") 'Authorization': 'Bearer $token',
      };

      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        await getAllNotices();
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String> getToken() async {
    String token = "";
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();

      token = pref.getString("token") ?? "";
    } catch (e) {
      print(e.toString());
    }

    return token;
  }
}
