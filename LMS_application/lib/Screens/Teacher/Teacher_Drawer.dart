import 'package:LMS_application/Screens/Teacher/Course/teacher_courses.dart';
import 'package:LMS_application/Screens/Teacher/Discussion/TeacherDiscussion.dart';
import 'package:LMS_application/Screens/Teacher/library/Libraryp.dart';
import 'package:LMS_application/Screens/Teacher/T_Slots/trianingTeacher.dart';
import 'package:LMS_application/Screens/auth-screen.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class TeacherDrawer extends StatelessWidget {
  final Teacher teacher;

  void _selectScreen(BuildContext ctx, Widget nextScreen) {
    Navigator.of(ctx).pop();
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return nextScreen;
      }),
    );
  }

  TeacherDrawer(this.teacher);
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
                      teacher.name,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomeTile(
              myIcon: Icons.info,
              txt: "Info",
              onTap: () => {},
            ),
            CustomeTile(
              myIcon: Icons.assignment_sharp,
              txt: "My Courses",
              onTap: () => _selectScreen(context, TeacherCourses(teacher)),
            ),
            CustomeTile(
              myIcon: Icons.chat,
              txt: "Discussion",
              onTap: () => _selectScreen(context, TeacherDiscussionForm()),
            ),
            CustomeTile(
              myIcon: Icons.library_books,
              txt: "Library",
              onTap: () => _selectScreen(context, Library()),
            ),
            CustomeTile(
              myIcon: Icons.work,
              txt: "Trainings",
              onTap: () => _selectScreen(context, TeacherTraining()),
            ),
            CustomeTile(
              myIcon: Icons.logout,
              txt: "LogOut",
              onTap: () {
                Navigator.of(context).pop();
                FirebaseAuth.instance.signOut();
                _selectScreen(context, AuthScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
