import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/add_notice.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/edit_notice.dart';

class ManageNoticesPage extends StatefulWidget {
  const ManageNoticesPage({super.key});

  @override
  State<ManageNoticesPage> createState() => _ManageNoticesPageState();
}

class _ManageNoticesPageState extends State<ManageNoticesPage> {
  @override
  Widget build(BuildContext context) {
    // Sample notice data
    final List<Map<String, String>> notices = [
      {
        "title": "Meeting Reminder",
        "date": "May 1, 2024",
        "desc": "Don't forget about the meeting at 10:00 AM",
      },
      {
        "title": "Exam Schedule",
        "date": "May 3, 2024",
        "desc": "Check your exam schedule on the portal",
      },
      {
        "title": "Holiday Notice",
        "date": "May 5, 2024",
        "desc": "University will be closed on May 5th",
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        255,
        255,
        255,
      ), // Light background color
      appBar: AppBar(
        title: const Text(
          "Manage Notices",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notices.length,
        itemBuilder: (context, index) {
          final notice = notices[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notice["title"]!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notice["date"]!,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 8),
                  Text(notice["desc"]!, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditNoticePage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        label: const Text(
                          "Edit",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton.icon(
                        onPressed: () {
                          // TODO: Delete notice
                        },
                        icon: const Icon(Icons.delete, color: Colors.red),
                        label: const Text(
                          "Delete",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoticePage()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 204, 216, 227),

        child: const Icon(Icons.add),
      ),
    );
  }
}
