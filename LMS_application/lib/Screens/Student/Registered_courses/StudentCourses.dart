import 'package:LMS_application/Screens/Student/Registered_courses/StudentCoursesList.dart';
import 'package:LMS_application/Screens/Student/Student_Drawer.dart';
import 'package:LMS_application/models/student.dart';
import 'package:flutter/material.dart';

class StudentCourses extends StatelessWidget {
  final Student student;
  //final List<Course> courses;
  StudentCourses(this.student);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StudentDrawer(student),
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StudentCoursesList(
              student,
            ),
          ],
        ),
      ),
    );
  }
}
