import 'package:flutter/material.dart';
import 'presentation/auth/screens/login_screen.dart';

void main() {
  runApp(const NoticeboardApp());
}

class NoticeboardApp extends StatelessWidget {
  const NoticeboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticeboard',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
