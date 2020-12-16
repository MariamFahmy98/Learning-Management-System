import 'package:flutter/material.dart';

class MyCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("كورسات مجنونة"),
      ),
      body: Center(
        child: Container(
            child: Text(
          "منورين الكورسات يا رغالة",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
