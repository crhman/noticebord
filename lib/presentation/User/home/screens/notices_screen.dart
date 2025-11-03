import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/User/home/screens/notification_screen.dart';
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
  @override
  Widget build(BuildContext context) {
    var notices = context.watch<NoticeService>().noticeList;
    return Scaffold(
      appBar: AppBar(
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
              // Marka icon la taabto
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
      body: context.watch<NoticeService>().isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: notices.length,
              itemBuilder: (context, index) {
                final notice = notices[index];
                return NoticeCard(
                  title: notice.title,
                  date: notice.createdAt.toLocal().toString().split('.').first,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NoticeDetailPage(notice: notice),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
