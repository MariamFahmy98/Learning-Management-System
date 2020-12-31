import 'package:LMS_application/Widgets/CustomeTile.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class TeacherCourseDrawer extends StatelessWidget {
  final Course course;
  TeacherCourseDrawer(this.course);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.purple[700],
                  Colors.purple[300],
                ]),
              ),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      course.courseName,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomeTile(
              myIcon: Icons.article_sharp,
              txt: "Materials",
              isTeacher: true,
            ),
            CustomeTile(
              myIcon: Icons.assignment,
              txt: "Assignments",
              isTeacher: true,
            ),
            CustomeTile(
              myIcon: Icons.all_inbox,
              txt: "Announcements",
              isTeacher: true,
            ),
            CustomeTile(
              myIcon: Icons.assignment_returned_sharp,
              txt: "Quizzes",
              isTeacher: true,
            ),
            CustomeTile(
              myIcon: Icons.request_page_rounded,
              txt: "Requests",
              isTeacher: true,
            ),
          ],
        ),
      ),
    );
  }
}
