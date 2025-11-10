import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/client/home/screens/home_sceen.dart';
import 'package:norticeboard/presentation/admin/AdminPage/screens/admin_page.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/services/notice_services.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/services/notification_service.dart';
import 'package:norticeboard/presentation/admin/UserManagement/services/user_management_ser.dart';
import 'package:norticeboard/provider.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'presentation/auth/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.initialize("510a3b1d-a1e9-405a-84b0-92eb39aed535");
  OneSignal.Notifications.requestPermission(true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => NoticeService()),
        ChangeNotifierProvider(create: (_) => UserManagementService()),
        ChangeNotifierProvider(create: (_) => NotificationService()),
      ],
      child: NoticeboardApp(),
    ),
  );
}

class NoticeboardApp extends StatefulWidget {
  const NoticeboardApp({super.key});

  @override
  State<NoticeboardApp> createState() => _NoticeboardAppState();
}

class _NoticeboardAppState extends State<NoticeboardApp> {
  bool isLoggedIn = false;
  String role = "user";

  @override
  void initState() {
    super.initState();
    verify();
  }

  void verify() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final loggedIn = pref.getBool("isLoggedIn") ?? false;
    final savedRole = pref.getString("role") ?? "user";
    setState(() {
      isLoggedIn = loggedIn;
      role = savedRole;
    });
    print(role);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticeboard',
      debugShowCheckedModeBanner: false,
      home: isLoggedIn
          ? role == "admin"
                ? AdminPage()
                : DashboardScreen()
          : LoginScreen(),
    );
  }
}
