import 'package:flutter/material.dart';
import '../classes/course.dart';
import 'all_courses_list.dart';
import '../classes/student.dart';

class StudentAvalabileCourse extends StatelessWidget {
  Student user;
  List<Course> allCourses;
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
