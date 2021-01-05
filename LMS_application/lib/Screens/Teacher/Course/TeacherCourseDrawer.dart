import 'package:LMS_application/Screens/Teacher/Assignments/teacher_assignments_list.dart';
import 'package:LMS_application/Screens/Teacher/Quiz/TeacherQuize.dart';
import 'package:LMS_application/Widgets/CustomeTile.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class TeacherCourseDrawer extends StatelessWidget {
  final Course course;

  TeacherCourseDrawer(this.course);

  void _selectScreen(BuildContext ctx, Widget nextScreen) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return nextScreen;
      }),
    );
  }

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
              onTap: () => {},
            ),
            CustomeTile(
              myIcon: Icons.assignment,
              txt: "Assignments",
              onTap: () =>
                  _selectScreen(context, TeacherAssignmentsList(course)),
            ),
            CustomeTile(
              myIcon: Icons.all_inbox,
              txt: "Announcements",
              onTap: () => {},
            ),
            CustomeTile(
              myIcon: Icons.assignment_returned_sharp,
              txt: "Quizzes",
              onTap: () => _selectScreen(context, TeacherQuize(course)),
            ),
            CustomeTile(
              myIcon: Icons.request_page_rounded,
              txt: "Requests",
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}
