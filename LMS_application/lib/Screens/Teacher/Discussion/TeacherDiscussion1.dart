import 'package:flutter/material.dart';

class TeacherDiscussion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("ديسكاشن مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الديسكاشن يا teacher",
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
