import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:norticeboard/model/notification_model.dart';

class NotificationService with ChangeNotifier {
  final String baseUrl = "https://noticebord.onrender.com";

  List<NotificationModel> _notifications = [];

  List<NotificationModel> get notifications => _notifications;
  bool isLoading = false;

  NotificationService() {
    getAllNotifications();
  }

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
      isLoading = true;
      final response = await http.get(
        Uri.parse('$baseUrl/api/notification/getAll_notification'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)["data"];
        _notifications = data
            .map((item) => NotificationModel.fromJson(item))
            .toList();

        notifyListeners();
      } else {
        print('Failed to fetch notices: ${response.body}');
      }
      print(notifications.length);
    } catch (e) {
      print("⚠️ Error fetching notifications: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
