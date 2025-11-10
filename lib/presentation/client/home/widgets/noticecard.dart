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
      elevation: 3, // yar u taago card-ka
      shadowColor: Colors.black26,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 100, // 👉 halkan waxaad beddeli kartaa dhererka card-ka
        padding: const EdgeInsets.all(12),
        child: ListTile(
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(date, style: const TextStyle(color: Colors.grey)),
          ),
          onTap: onTap,
          trailing: const Icon(Icons.arrow_forward_ios, size: 18),
        ),
      ),
    );
  }
}
