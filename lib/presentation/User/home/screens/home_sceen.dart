import 'package:flutter/material.dart';
import 'package:norticeboard/model/notice_model.dart';
import 'package:norticeboard/presentation/User/home/widgets/noticecard.dart';
import 'package:norticeboard/presentation/User/profile/screens/profile_screen.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/add_notice.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/manage_notices.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/notice_detail.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/services/notice_services.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future<List<Notice>> _futureNotices;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _futureNotices = NoticeService.getAllNotices();
  }

  Widget _buildHome() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Noticeboard",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Notice>>(
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
                    itemCount: notices.length,
                    itemBuilder: (context, index) {
                      final notice = notices[index];
                      return NoticeCard(
                        title: notice.title,
                        date: notice.createdAt
                            .toLocal()
                            .toString()
                            .split('.')
                            .first,
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget body;
    if (_selectedIndex == 0) {
      body = _buildHome();
    } else {
      body = ManageNoticesPage();
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
