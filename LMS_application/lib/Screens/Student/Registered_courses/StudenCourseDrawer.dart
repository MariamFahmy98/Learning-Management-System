import 'package:LMS_application/Screens/Student/Announcement/StudentAnnouncements.dart';
import 'package:LMS_application/Screens/Student/Assignments/student_assignments_list.dart';
import 'package:LMS_application/Widgets/CustomeTile.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Screens/Student/Materials/studentMaterial.dart';
import 'package:LMS_application/Screens/Student/officehours/officehours.dart';
import 'package:LMS_application/Screens/Student/Quiz/StudentQuiz.dart';


class StudentCourseDrawer extends StatelessWidget {
  final Course course;
  final Student student;

  StudentCourseDrawer(this.student, this.course);

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
              onTap: () => _selectScreen(context, StudentMaterialsList(course)),
            ),
            CustomeTile(
              myIcon: Icons.lock_clock,
              txt: "Officehours",
              onTap: () =>
                  _selectScreen(context, TeacherOfficehoursList(course)),
            ),
            CustomeTile(
              myIcon: Icons.assignment,
              txt: "Assignments",
              onTap: () => _selectScreen(
                  context, StudentAssignmentsList(student, course)),
            ),
            CustomeTile(
              myIcon: Icons.all_inbox,
              txt: "Announcements",
              onTap: () => _selectScreen(context, StudentAnnouncements(course)),
            ),
            CustomeTile(
              myIcon: Icons.assignment_returned_sharp,
              txt: "Quizzes",
              onTap: () => _selectScreen(context, StudentQuiz(course, student)),
            ),
          ],
        ),
      ),
    );
  }
}
