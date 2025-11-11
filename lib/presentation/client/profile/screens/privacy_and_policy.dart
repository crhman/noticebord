import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy"), centerTitle: true),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Himilo Noticeboard App - Privacy Policy",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 12),
            Text(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              "Effective Date: November 9, 2025\n"
              "Developer: Abdirahman Abdifatah Hussein\n\n",
            ),
            // SizedBox(height: 12),
            Text(
              "We respect your privacy and are committed to protecting your personal information.\n\n"
              "1. Information We Collect\n"
              "- Name\n"
              "- Email Address\n"
              "- Phone Number\n\n"
              "2. How We Use Your Information\n"
              "- Identify and verify student or staff users\n"
              "- Send important notices and updates\n"
              "- Improve app experience\n\n"
              "3. Data Storage & Security\n"
              "Your data is securely stored in MongoDB. We use security measures to protect it from unauthorized access.\n\n"
              "4. Data Sharing\n"
              "We do not sell, rent, or share your personal data with third parties, unless required by law.\n\n"
              "5. Your Rights\n"
              "You can request access, correction, or deletion of your personal data by contacting:\n"
              "Email: crahmanbahal@gmail.com\n\n"
              "6. Updates to Policy\n"
              "We may update this Privacy Policy periodically. Changes will be posted within the app.\n\n"
              "By using this app, you agree to this Privacy Policy.\n\n"
              "Thank you for trusting Himilo Noticeboard App!",
              style: TextStyle(fontSize: 15, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
