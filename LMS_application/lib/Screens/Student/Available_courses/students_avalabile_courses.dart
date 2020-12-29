import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:flutter/material.dart';
import 'all_courses_list.dart';

class StudentAvalabileCourse extends StatelessWidget {
  final Student user;
  final List<Course> allCourses;
  StudentAvalabileCourse({this.user, this.allCourses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avalabile Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AllCoursesList(
              myCourses: allCourses,
              user: user,
            ),
          ],
        ),
      ),
    );
  }
}
