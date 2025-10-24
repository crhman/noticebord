import 'dart:convert';
import 'package:http/http.dart' as http;

/// Base URL of your backend server
const String baseUrl = "http://localhost:5000/api/notices"; 
// ⚠️ Haddii aad emulator isticmaalayso Android Studio, 
// beddel localhost → 10.0.2.2

class NoticeService {
  // ✅ Get all notices
  static Future<List<dynamic>> getAllNotices() async {
    final url = Uri.parse(baseUrl);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['data'] ?? [];
    } else {
      throw Exception('Failed to fetch notices: ${response.body}');
    }
  }

  
}
