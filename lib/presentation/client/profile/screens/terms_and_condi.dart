import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Himilo Noticeboard App - Terms & Conditions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),

            Text(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              "Effective Date: November 9, 2025\n"
              "Developer: Abdirahman Abdifatah Hussein\n\n",
            ),
            SizedBox(height: 12),
            Text(
              "By registering or using the Himilo Noticeboard App, you agree to comply with these Terms & Conditions. "
              "If you do not agree, please stop using the app immediately.\n\n"
              "1. Use of the App\n"
              "- The app is for students and staff to access university notices.\n"
              "- You must provide accurate name, email, and phone number.\n"
              "- Misuse for spam or unauthorized activity is prohibited.\n\n"
              "2. Account Responsibility\n"
              "You are responsible for keeping your login credentials safe and for any activity done using your account.\n\n"
              "3. Data Collection\n"
              "We collect your name, email, and phone number to help identify users and manage communication. "
              "This data is stored securely in MongoDB via a Node.js backend.\n\n"
              "4. Intellectual Property\n"
              "All app design and content belong to the developer, Abdirahman Abdifatah Hussein. "
              "Reproduction without permission is not allowed.\n\n"
              "5. Limitation of Liability\n"
              "The app is provided 'as is' without warranty. The developer is not responsible for losses due to misuse or technical issues.\n\n"
              "6. Updates to Terms\n"
              "These Terms may be updated. You will be notified in-app when significant changes occur.\n\n"
              "Thank you for using Himilo Noticeboard App!",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
