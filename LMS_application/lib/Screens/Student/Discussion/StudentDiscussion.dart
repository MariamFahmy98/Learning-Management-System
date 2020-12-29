import 'package:LMS_application/models/User.dart';
import 'package:flutter/material.dart';

class StudentDiscussion extends StatelessWidget {
  final User name;
  StudentDiscussion(this.name);

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
            "منورين الديسكاشن يا طالب" + name.name,
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
