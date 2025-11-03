import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:norticeboard/presentation/admin/NoticeMangement/services/notice_services.dart';

class NotificationService {
  final String baseUrl = "https://noticebord.onrender.com";

  Future<void> sendNotification(String title, String message) async {
    try {
      //  String token = await NoticeService.getToken();
      final response = await http.post(
        Uri.parse('$baseUrl/api/notification/send-notification'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'message': message,
          'imageUrl': null,

          // if (token != "") 'Authorization': 'Bearer $token'
        }),
      );

      if (response.statusCode == 200) {
        print("📢 Notification sent successfully");
      } else {
        print("❌ Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("⚠️ Error sending notification: $e");
    }
  }
}
