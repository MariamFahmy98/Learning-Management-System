import 'package:LMS_application/models/teacher.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class TeacherDrawer extends StatelessWidget {
  final Teacher teacher;

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
              isTeacher: true,
              user: teacher,
            ),
            CustomeTile(
              myIcon: Icons.assignment_sharp,
              txt: "My Courses",
              isTeacher: true,
              user: teacher,
            ),
            CustomeTile(
              myIcon: Icons.chat,
              txt: "Discussion",
              isTeacher: true,
              user: teacher,
            ),
            CustomeTile(
              myIcon: Icons.library_books,
              txt: "Library",
              isTeacher: true,
              user: teacher,
            ),
            CustomeTile(
              myIcon: Icons.logout,
              txt: "LogOut",
              isTeacher: true,
              user: teacher,
            ),
          ],
        ),
      ),
    );
  }
}
