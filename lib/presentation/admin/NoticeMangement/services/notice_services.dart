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
}
