import 'package:flutter/material.dart';
import 'package:norticeboard/presentation/client/profile/screens/privacy_and_policy.dart';
import 'package:norticeboard/presentation/client/profile/screens/terms_and_condi.dart';
import 'package:norticeboard/theme_provider.dart';
import 'package:provider/provider.dart';
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
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Midabyo dynamic ah
    final containerColor = isDark ? Colors.grey[900] : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final iconColor = Colors.blueAccent;

    return Scaffold(
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
            const SizedBox(height: 10),

            // Profile Image
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

            const SizedBox(height: 10),
            Text(
              "abdirahman abdifatah",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              "crahmanbahal@gmail.com",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: textColor,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Role: Admin",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.blueAccent,
              ),
            ),

            const SizedBox(height: 10),
            Divider(
              thickness: 1,
              color: isDark ? Colors.grey[700] : Colors.grey[300],
            ),

            // Reusable ListTile Container widget
            buildListTileContainer(
              context,
              icon: Icons.person,
              title: "User Info",
              iconColor: iconColor,
              containerColor: containerColor!,
              textColor: textColor!,
              onTap: () {},
            ),

            buildSwitchTileContainer(
              context,
              title: "Enable Notifications",
              value: isEnabled,
              onChanged: (v) => setState(() => isEnabled = v),
              icon: Icons.notifications,
              isDark: isDark,
              containerColor: containerColor,
              textColor: textColor,
            ),

            buildSwitchTileContainer(
              context,
              title: "Enable Dark Mode",
              value: themeProvider.isDarkMode,
              onChanged: (v) => themeProvider.toggleTheme(),
              icon: Icons.dark_mode,
              isDark: isDark,
              containerColor: containerColor,
              textColor: textColor,
            ),

            buildListTileContainer(
              context,
              icon: Icons.privacy_tip,
              title: "Privacy And Policy",
              iconColor: iconColor,
              containerColor: containerColor,
              textColor: textColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const PrivacyPolicyScreen(),
                  ),
                );
              },
            ),

            buildListTileContainer(
              context,
              icon: Icons.article_outlined,
              title: "Terms And Condition",
              iconColor: iconColor,
              containerColor: containerColor,
              textColor: textColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TermsScreen()),
                );
              },
            ),

            const SizedBox(height: 10),
            SizedBox(
              width: 530,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () => _showLogoutDialog(context),
                child: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper: ListTile Container
  Widget buildListTileContainer(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Color iconColor,
    required Color containerColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title, style: TextStyle(fontSize: 18, color: textColor)),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isDark(context) ? Colors.white70 : Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }

  // Helper: SwitchListTile Container
  Widget buildSwitchTileContainer(
    BuildContext context, {
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required IconData icon,
    required bool isDark,
    required Color containerColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: SwitchListTile(
        title: Text(title, style: TextStyle(color: textColor, fontSize: 18)),
        value: value,
        onChanged: onChanged,
        secondary: Icon(icon, color: Colors.blueAccent),
        activeColor: Colors.blueAccent,
        inactiveThumbColor: isDark ? Colors.grey[700] : Colors.grey[400],
        inactiveTrackColor: isDark ? Colors.grey[600] : Colors.grey[300],
      ),
    );
  }

  bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
