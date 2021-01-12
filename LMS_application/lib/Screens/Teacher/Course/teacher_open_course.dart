import 'package:LMS_application/Screens/Teacher/Course/TeacherCourseDrawer.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class TeacherOpenCourse extends StatelessWidget {
  final Course runningCourse;
  TeacherOpenCourse(this.runningCourse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherCourseDrawer(runningCourse),
      appBar: AppBar(
        title: Text(runningCourse.courseCode),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(5),
            child: Text(
              runningCourse.courseName + ' (' + runningCourse.courseCode + ')',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text(
              'Course description: -\n' +
                  runningCourse.courseDescription +
                  '\n \nCredit hours:- ' +
                  runningCourse.courseCreditHours +
                  'h',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}