import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NotificationService with ChangeNotifier {
  final String baseUrl = "https://noticebord.onrender.com";

  List<dynamic> _notifications = [];

  List<dynamic> get notifications => _notifications;

  // 📨 Send notification
  Future<void> sendNotification(String title, String message) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/notification/send-notification'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'title': title,
          'message': message,
          'imageUrl': null,
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

  // 📋 Fetch all notifications
  Future<void> getAllNotifications() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/api/notification/getAll_notification'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Assuming the backend returns a list
        if (data is List) {
          _notifications = data;
        } else if (data['notifications'] is List) {
          _notifications = data['notifications'];
        } else {
          _notifications = [];
        }
        print(response.body);

        print(
          "📢 Notifications fetched successfully (${_notifications.length})",
        );
        notifyListeners();
      } else {
        print("❌ Failed to fetch notifications: ${response.body}");
      }
    } catch (e) {
      print("⚠️ Error fetching notifications: $e");
    }
  }
}
