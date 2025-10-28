import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:norticeboard/model/notice_model.dart';

const String baseUrl = "https://noticebord.onrender.com";

class NoticeService {
  static Future<List<Notice>> getAllNotices() async {
    final url = Uri.parse("$baseUrl/api/notices"); // ✅ Hal slash kaliya
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> noticeList = data['data'] ?? [];
      return noticeList.map((e) => Notice.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch notices: ${response.body}');
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

  // // ✅ Create a new notice (Admin)
  // static Future<Map<String, dynamic>> createNotice({
  //   required String title,
  //   required String description,
  //   String? token, // optional auth token
  // }) async {
  //   final url = Uri.parse(baseUrl);
  //   final headers = {
  //     'Content-Type': 'application/json',
  //     if (token != null) 'Authorization': 'Bearer $token',
  //   };

  //   final body = jsonEncode({
  //     'title': title,
  //     'description': description,
  //   });

  //   final response = await http.post(url, headers: headers, body: body);

  //   if (response.statusCode == 201) {
  //     return jsonDecode(response.body);
  //   } else {
  //     throw Exception('Failed to create notice: ${response.body}');
  //   }
  // }
// ✅ Update notice by ID
static Future<Map<String, dynamic>> updateNotice(String id, String trim, {
  required String title,
  required String description,
  String? token,
}) async {
  final url = Uri.parse('$baseUrl/api/notices/$id');
  final headers = {
    'Content-Type': 'application/json',
    if (token != null) 'Authorization': 'Bearer $token',
  };

  final body = jsonEncode({
    'title': title.trim(),
    'description': description.trim(),
  });

  final response = await http.put(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to update notice: ${response.body}');
  }
}


  // ✅ Delete notice by ID (Admin)
  static Future<void> deleteNotice(String id, {String? token}) async {
    final url = Uri.parse('$baseUrl/$id');
    final headers = {if (token != null) 'Authorization': 'Bearer $token'};

    final response = await http.delete(url, headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete notice: ${response.body}');
    }
  }
}
