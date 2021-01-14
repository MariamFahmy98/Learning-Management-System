import 'package:LMS_application/Screens/Student/Available_courses/CourseCard.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class AllCoursesList extends StatelessWidget {
  //final Course course;
  final Student student;

  AllCoursesList(this.student);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avalabile Courses'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: Database('lms-app-5528f').allCoursesData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            List<Course> courses = snapshot.data;
            return (courses.length == 0)
                ? Text(
                    'No Avalabile Courses',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => CourseCard(
                      course: courses[index],
                      student: student,
                    ),
                    itemCount: courses.length,
                  );
          },
        ),
      ),
    );
  }
}
