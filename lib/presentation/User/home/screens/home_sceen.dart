import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/manage_notice.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/screens/notice_detail.dart';
import 'package:norticeboard/presentation/admin/UserManagement/screens/user_management.dart';

void main() {
  runApp(NoticeboardApp());
}

class NoticeboardApp extends StatelessWidget {
  const NoticeboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Screens for navigation
  final List<Widget> _pages = [
    DashboardScreen(),
    ManageNoticeScreen(),
    UserManagementScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            label: 'Manage Notice',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'User Manager',
          ),
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome back,", style: TextStyle(fontSize: 28)),
              Text(
                "Username",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "Noticeboard",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    NoticeCard(title: "Meeting Reminder", date: "May 1, 2024"),
                    NoticeCard(
                      title: "New Company Policy",
                      date: "April 25, 2024",
                    ),
                    NoticeCard(
                      title: "xirida schoolka",
                      date: "march 20, 2024",
                    ),
                    NoticeCard(title: "furista shoolka", date: "june 18, 2024"),
                    NoticeCard(title: "fasalada", date: "April 20, 2024"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoticeCard extends StatelessWidget {
  final String title;
  final String date;

  const NoticeCard({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(26),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(date),
          onTap: () {
            // Navigate to notice detail
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NoticeDetailPage()),
            );
          },
        ),
      ),
    );
  }
}
