import 'package:flutter/material.dart';
import '../classes/course.dart';
import 'student_courses_list.dart';

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
            MyCoursesList(
              myCourses: courses,
            ),
          ],
        ),
      ),
    );
  }
}
