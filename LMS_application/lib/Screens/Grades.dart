import 'package:flutter/material.dart';

class Grades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("درجات مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الدرجات يا رغالة",
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
