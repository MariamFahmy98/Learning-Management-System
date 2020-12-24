import 'package:LMS_application/Screens/Student/Registered_courses/StudentCoursesList.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class StudentCourses extends StatelessWidget {
  final List<Course> courses;
  StudentCourses(this.courses);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StudentCoursesList(
              myCourses: courses,
            ),
          ],
        ),
      ),
    );
  }
}
