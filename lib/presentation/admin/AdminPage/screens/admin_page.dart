import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/admin/AdminPage/screens/admin_home_screen.dart';
import 'package:norticeboard/presentation/admin/AdminPage/screens/admin_profile_screen.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _cureentInex = 0;
  List<Widget> admin_screens = [AdminHomeScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // background cad
      body: admin_screens[_cureentInex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cureentInex,
        onTap: (value) {
          _cureentInex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: "profile",
          ),
        ],
      ),
    );
  }
}
