import 'package:flutter/material.dart';

class NoticeCard extends StatelessWidget {
  final String title;
  final String date;
  final VoidCallback onTap;

  const NoticeCard({
    super.key,
    required this.title,
    required this.date,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(date),
        onTap: onTap,
      ),
    );
  }
}
