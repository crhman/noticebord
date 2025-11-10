import 'package:flutter/material.dart';
import '../../../auth/screens/login_screen.dart';
import '../../../auth/services/user_services.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close dialog first
              await UserServices().logOut(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 216, 215, 215),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Center(
            child: ClipOval(
              child: Image.asset(
                "assets/profile.jpg",
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 10),
          Text(
            "abdirahman abdifatah",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            "crahmanbahal@gmail.com",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
          ),
          SizedBox(height: 5),
          Text(
            "Role: Admin",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blueAccent,
            ),
          ),

          SizedBox(height: 10),
          Divider(thickness: 1, color: Colors.grey[300]),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blueAccent),
            title: Text("User Information", style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.pushNamed(context, '/user_info');
            },
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blueAccent),
            title: Text("setting", style: TextStyle(fontSize: 18)),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.blueAccent),
            title: Text("account", style: TextStyle(fontSize: 18)),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.notifications, color: Colors.blueAccent),
            title: Text("Notifications", style: TextStyle(fontSize: 18)),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.app_blocking, color: Colors.blueAccent),
            title: Text("App Info", style: TextStyle(fontSize: 18)),
            onTap: () {},
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.redAccent),
            title: Text("Logout", style: TextStyle(fontSize: 18)),
            onTap: () {
              _showLogoutDialog(context);
            },
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
