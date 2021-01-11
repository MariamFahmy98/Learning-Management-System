import 'package:LMS_application/models/teacher.dart';
import 'package:flutter/material.dart';
import 'teacher_course_list.dart';


class TeacherCourses extends StatelessWidget {
  final Teacher teacher;
  TeacherCourses(this.teacher);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TeacherCoursesList(teacher),
          ],
        ),
      ),
    );
  }
}
