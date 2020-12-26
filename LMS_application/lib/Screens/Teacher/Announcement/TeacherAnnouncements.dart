import 'package:flutter/material.dart';

class TeacherAnnouncements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("انونسمنت مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الانونسيمينت يا Teachers",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}