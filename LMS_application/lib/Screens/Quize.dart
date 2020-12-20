import 'package:LMS_application/Screens/CreateQuiz.dart';
import 'package:flutter/material.dart';

class Quizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateQuize()),
          );
        },
      ),
    );
  }
}
