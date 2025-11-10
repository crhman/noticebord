import 'dart:convert';


class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String notificationId;

  NotificationModel({required this.id, required this.title, required this.message, required this.notificationId});
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'message': message,
      'notificationId': notificationId,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map['id'] as String,
      title: map['title'] as String,
      message: map['message'] as String,
      notificationId: map['notificationId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) => NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
