// import 'dart:convert';

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String notificationId;
  final DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    required this.notificationId,
    required this.createdAt,
    
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'title': title,
  //     'message': message,
  //     'notificationId': notificationId,
  //     'createdAt': createdAt.toIso8601String(),
      
  //   };
  // }

  factory NotificationModel.fromJson(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['_id'] ?? "",
      title: map['title'] ?? "",
      message: map['message'] ?? "",
      notificationId: map['notificationId'] ?? "",
      createdAt: DateTime.parse(map['createdAt']),
    );
  }

  // String toJson() => json.encode(toMap());

  // factory NotificationModel.fromJson(String source) =>
  //     NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
