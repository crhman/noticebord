import 'package:flutter/material.dart';
import 'package:norticeboard/model/notice_model.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/add_notice.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/edit_notice.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/services/notice_services.dart';

class ManageNoticesPage extends StatefulWidget {
  const ManageNoticesPage({super.key});

  @override
  State<ManageNoticesPage> createState() => _ManageNoticesPageState();
}

class _ManageNoticesPageState extends State<ManageNoticesPage> {
  late Future<List<Notice>> _futureNotices;

  @override
  void initState() {
    super.initState();
    _futureNotices = NoticeService.getAllNotices(); // Ka hel notices backend
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Manage Notices",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: FutureBuilder<List<Notice>>(
        future: _futureNotices,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No notices found."));
          }

          final notices = snapshot.data!;
          return ListView.builder(
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
                        notice.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        notice.createdAt.toLocal().toString().split('.').first,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notice.description ?? 'No description provided.',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditNoticePage(notice: notice),
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
                            onPressed: () {},
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
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNoticePage()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 204, 216, 227),
        child: const Icon(Icons.add),
      ),
    );
  }
}
