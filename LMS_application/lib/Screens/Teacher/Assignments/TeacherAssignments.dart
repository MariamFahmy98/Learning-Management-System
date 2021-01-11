import 'package:flutter/material.dart';

class TeacherAssignments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("اسايمنتات مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الاسايمنتات يا Teachers",
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
