import 'dart:convert';
import 'package:http/http.dart' as http;

/// Base URL of your backend server
const String baseUrl = "https://noticebord.onrender.com"; 


class NoticeService {
  // ✅ Get all notices
  static Future<List<dynamic>> getAllNotices() async {
    final url = Uri.parse("$baseUrl//api/notices");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'] ?? [];
    } else {
      throw Exception('Failed to fetch notices: ${response.body}');
    }
  }

  
}
