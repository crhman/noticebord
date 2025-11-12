import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/client/profile/screens/privacy_and_policy.dart';
import 'package:norticeboard/presentation/client/profile/screens/terms_and_condi.dart';
import '../../../auth/screens/login_screen.dart';
import '../../../auth/services/user_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  bool isEnabled = false;
  bool isDark = false;

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
      body: SingleChildScrollView(
        child: Column(
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

            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
                // border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: ListTile(
                leading: Icon(Icons.app_blocking, color: Colors.blueAccent),
                title: Text("User Info", style: TextStyle(fontSize: 18)),
                onTap: () {},
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
                // border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: SwitchListTile(
                title: Text('Enable Notifications'),
                // subtitle: Text('Turn on or off'),
                value: isEnabled,
                onChanged: (value) {
                  setState(() {
                    isEnabled = value;
                  });
                },
                secondary: Icon(Icons.notifications, color: Colors.blueAccent),
              ),
            ),

            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
                // border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: SwitchListTile(
                title: Text('Enable Dark Mode'),
                // subtitle: Text('Turn on or off'),
                value: isDark,
                onChanged: (value) {
                  setState(() {
                    isDark = value;
                  });
                },
                secondary: Icon(Icons.dark_mode, color: Colors.blueAccent),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
                // border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: ListTile(
                leading: Icon(Icons.app_blocking, color: Colors.blueAccent),
                title: Text(
                  "Privacy And Policy",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PrivacyPolicyScreen(),
                    ),
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            Container(
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
                // border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: ListTile(
                leading: Icon(Icons.app_blocking, color: Colors.blueAccent),
                title: Text(
                  "Terms And Condition",
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const TermsScreen()),
                  );
                },
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),

            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
                // border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: SizedBox(
                width: 530,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    _showLogoutDialog(context);
                  },
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
