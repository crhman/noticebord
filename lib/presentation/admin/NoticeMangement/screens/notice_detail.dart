import 'package:flutter/material.dart';
import 'package:norticeboard/model/notice_model.dart';
import 'package:norticeboard/presentation/client/home/screens/home_sceen.dart';

class NoticeDetailPage extends StatelessWidget {
  final Notice notice; // 👈 Xogta notice-ka

  const NoticeDetailPage({super.key, required this.notice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Button
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                notice.title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),

              // Date
              Text(
                notice.createdAt.toLocal().toString().split(' ')[0],
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),

              // Description box
              Center(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: const Color.fromARGB(255, 199, 210, 220),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    notice.description,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
