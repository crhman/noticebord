import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SafeArea(
        child: Center(
          child: Text("profile_screen", style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
