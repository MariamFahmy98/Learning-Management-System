import 'package:flutter/material.dart';

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("زهقت مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الزهق يا رغالة",
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
