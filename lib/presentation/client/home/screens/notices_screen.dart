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

  @override
  Widget build(BuildContext context) {
    var notices = context.watch<NoticeService>().noticeList;
    return Scaffold(
      // backgroundColor: const Color(0xFFF9FAFB),
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
                  date: formatDate(notice.createdAt.toString() ?? ""),
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
