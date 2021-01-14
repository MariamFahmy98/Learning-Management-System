<<<<<<< HEAD
import 'package:LMS_application/Screens/Teacher/Course/teacher_courses.dart';
import 'package:LMS_application/Screens/Teacher/Discussion/TeacherDiscussion.dart';
import 'package:LMS_application/Screens/Teacher/library/Libraryp.dart';
=======
import 'package:LMS_application/Screens/Teacher/CV/TeacherCV.dart';
import 'package:LMS_application/Screens/Teacher/Course/teacher_courses.dart';
import 'package:LMS_application/Screens/Teacher/Discussion/TeacherDiscussion.dart';
import 'package:LMS_application/Screens/Teacher/library/Libraryp.dart';
import 'package:LMS_application/Screens/Teacher/T_Slots/trianingTeacher.dart';
import 'package:LMS_application/Screens/Teacher/CV/TeacherCV.dart';
import 'package:LMS_application/Screens/auth-screen.dart';
>>>>>>> sharnoby
import 'package:LMS_application/models/teacher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class TeacherDrawer extends StatelessWidget {
  final Teacher teacher;

  void _selectScreen(BuildContext ctx, Widget nextScreen) {
<<<<<<< HEAD
=======
    Navigator.of(ctx).pop();
>>>>>>> sharnoby
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
<<<<<<< HEAD
              onTap: () => {},
=======
              onTap: () => _selectScreen(context, TeacherCV()),
>>>>>>> sharnoby
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
<<<<<<< HEAD
              myIcon: Icons.logout,
              txt: "LogOut",
              onTap: () => FirebaseAuth.instance.signOut(),
=======
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
>>>>>>> sharnoby
            ),
          ],
        ),
      ),
    );
  }
}
