class Notice {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;

  Notice({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  // Convert JSON -> Notice
  factory Notice.fromJson(Map<String, dynamic> json) {
    return Notice(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',

      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Convert Notice -> JSON (for posting)
  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }
}
