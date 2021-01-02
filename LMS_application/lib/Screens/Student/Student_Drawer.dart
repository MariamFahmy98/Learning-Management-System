import 'package:LMS_application/models/student.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class StudentDrawer extends StatelessWidget {
  final Student student;

  StudentDrawer(this.student);
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
              isTeacher: false,
              user: student,
            ),
            CustomeTile(
              myIcon: Icons.assignment_sharp,
              txt: "My Courses",
              isTeacher: false,
              user: student,
            ),
            CustomeTile(
              myIcon: Icons.assignment_turned_in,
              txt: "Available Courses",
              isTeacher: false,
              user: student,
            ),
            CustomeTile(
              myIcon: Icons.chat,
              txt: "Discussion",
              isTeacher: false,
              user: student,
            ),
            CustomeTile(
              myIcon: Icons.library_books,
              txt: "Library",
              isTeacher: false,
              user: student,
            ),
            CustomeTile(
              myIcon: Icons.logout,
              txt: "LogOut",
              isTeacher: false,
              user: student,
            ),
          ],
        ),
      ),
    );
  }
}
