import 'package:LMS_application/Screens/Student/Discussion/StudentDiscussion.dart';
import 'package:LMS_application/Screens/Student/Library/studentLibrary.dart';
import 'package:LMS_application/Screens/Student/Registered_courses/StudentCourses.dart';
import 'package:LMS_application/Screens/Student/Available_courses/AllCoursesList.dart';
import 'package:LMS_application/models/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class StudentDrawer extends StatelessWidget {
  final Student student;

  StudentDrawer(this.student);

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
                      "Student/Teacher full name",
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
              onTap: () => _selectScreen(context, StudentCourses(student)),
            ),
            CustomeTile(
              myIcon: Icons.assignment_turned_in,
              txt: "Available Courses",
              onTap: () => _selectScreen(context, AllCoursesList(student)),
            ),
            CustomeTile(
              myIcon: Icons.chat,
              txt: "Discussion",
              onTap: () => _selectScreen(context, StudentDiscussionForm()),
            ),
            CustomeTile(
              myIcon: Icons.library_books,
              txt: "Library",
              onTap: () => _selectScreen(context, SLibrary()),
            ),
            CustomeTile(
              myIcon: Icons.logout,
              txt: "LogOut",
              onTap: () => FirebaseAuth.instance.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
