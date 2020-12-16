import 'package:flutter/material.dart';

class Quizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("كويزات مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الكويزات يا رغالة",
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
