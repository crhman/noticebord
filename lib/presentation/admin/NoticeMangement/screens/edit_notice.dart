import 'package:flutter/material.dart';
import 'package:norticeboard/model/notice_model.dart';
import 'package:norticeboard/presentation/admin/NoticeMangement/services/notice_services.dart';

class EditNoticePage extends StatefulWidget {
  final Notice notice;

  const EditNoticePage({super.key, required this.notice});

  @override
  State<EditNoticePage> createState() => _EditNoticePageState();
}

class _EditNoticePageState extends State<EditNoticePage> {
  late TextEditingController _titleController;
  late TextEditingController _dateController;
  late TextEditingController _descController;
  
  bool get _isLoading => false;

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Edit Notice",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Date",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _descController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: ()  {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 50,
                ),
              ),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: Color.fromARGB(255, 255, 255, 255),
                    )
                  : const Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
