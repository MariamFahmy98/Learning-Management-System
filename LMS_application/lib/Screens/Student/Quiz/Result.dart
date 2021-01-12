import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

import 'StudentQuiz.dart';

class Result extends StatelessWidget {
  final Course course;
  Result(this.course);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        title: Text(
            //widget.course.courseName +
            "Quiz Result"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              child: Text(
                "You score: ",
                style: TextStyle(fontSize: 30, color: Colors.black87),
              )),
          Text(
            "2 out of 3",
            style: TextStyle(fontSize: 25, color: Colors.black87),
          ),
          SizedBox(
            height: 150,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return StudentQuiz(course);
                }));
              },
              child: Text(
                "return to quizzes",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
