import 'package:LMS_application/Screens/Teacher/Assignments/teacher_assignments_list.dart';
<<<<<<< HEAD
import 'package:LMS_application/Widgets/CustomeTile.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class TeacherCourseDrawer extends StatelessWidget {
  final Course course;
  
=======
import 'package:LMS_application/Screens/Teacher/Announcement/TeacherAnnouncements.dart';
import 'package:LMS_application/Screens/Teacher/Materials_Doc/Materials_doc.dart';
import 'package:LMS_application/Screens/Teacher/Office_Hours/officehours.dart';
import 'package:LMS_application/Widgets/CustomeTile.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Screens/Teacher/Course/TeacherRequestsPage.dart';
import 'package:LMS_application/Screens/Teacher/Quiz/TeacherQuiz.dart';

class TeacherCourseDrawer extends StatelessWidget {
  final Course course;

>>>>>>> sharnoby
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
<<<<<<< HEAD
              onTap: () => {},
=======
              onTap: () => _selectScreen(context, TeacherMaterialsList(course)),
>>>>>>> sharnoby
            ),
            CustomeTile(
              myIcon: Icons.assignment,
              txt: "Assignments",
<<<<<<< HEAD
              onTap: () =>  _selectScreen(context, TeacherAssignmentsList(course)),
=======
              onTap: () =>
                  _selectScreen(context, TeacherAssignmentsList(course)),
>>>>>>> sharnoby
            ),
            CustomeTile(
              myIcon: Icons.all_inbox,
              txt: "Announcements",
<<<<<<< HEAD
              onTap: () => {},
=======
              onTap: () => _selectScreen(context, TeacherAnnouncements(course)),
            ),
            CustomeTile(
              myIcon: Icons.lock_clock,
              txt: "Office Hours",
              onTap: () =>
                  _selectScreen(context, TeacherOfficehoursList(course)),
>>>>>>> sharnoby
            ),
            CustomeTile(
              myIcon: Icons.assignment_returned_sharp,
              txt: "Quizzes",
<<<<<<< HEAD
              onTap: () => {},
            ),
            CustomeTile(
              myIcon: Icons.request_page_rounded,
              txt: "Requests",
              onTap: () => {},
=======
              onTap: () => _selectScreen(context, TeacherQuiz(course)),
            ),
            CustomeTile(
              myIcon: Icons.request_page_rounded,
              txt: 'Requests   '+'(${course.requests.length})',
              onTap: () => _selectScreen(context, TeacherRequestsPage(course)),
>>>>>>> sharnoby
            ),
          ],
        ),
      ),
    );
  }
}
