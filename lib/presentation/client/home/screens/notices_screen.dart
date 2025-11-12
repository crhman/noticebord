import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:norticeboard/presentation/client/home/screens/notification_screen.dart';
import 'package:provider/provider.dart';
import '../../../admin/NoticeMangement/screens/notice_detail.dart';
import '../../../admin/NoticeMangement/services/notice_services.dart';
import '../widgets/noticecard.dart';

class NoticesScreen extends StatefulWidget {
  const NoticesScreen({super.key});

  @override
  State<NoticesScreen> createState() => _NoticesScreenState();
}

class _NoticesScreenState extends State<NoticesScreen> {
  String formatDate(String dateString) {
    try {
      DateTime dateTime = DateTime.parse(dateString).toLocal();
      return DateFormat('dd, MM, yyyy - hh:mm a').format(dateTime);
    } catch (e) {
      return '';
    }
  }

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    var notices = context.watch<NoticeService>().noticeList;
    var filteredNotices = notices.where((notice) {
      return notice.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          notice.description.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.filter_list, color: Colors.blueAccent),
          onPressed: () {
            // Marka filter la taabto (tusaale ahaan, future filter options)
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Filter Options",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.new_releases_outlined),
                      title: const Text("Newest first"),
                      onTap: () {
                        // Future: sorting/filtering logic
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: const Text("Oldest first"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        title: const Text(
          "Notices",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // 🔍 Search field
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search notices...",
                prefixIcon: const Icon(Icons.search, color: Colors.blueAccent),
                filled: true,
                fillColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.grey[900]
                    : Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),

          // 📋 List of notices
          Expanded(
            child: context.watch<NoticeService>().isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredNotices.isEmpty
                ? const Center(child: Text("No notices found"))
                : ListView.builder(
                    itemCount: filteredNotices.length,
                    itemBuilder: (context, index) {
                      final notice = filteredNotices[index];
                      return NoticeCard(
                        title: notice.title,
                        message: notice.description,
                        date: formatDate(notice.createdAt.toString() ?? ""),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  NoticeDetailPage(notice: notice),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
