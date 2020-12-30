import 'package:LMS_application/Widgets/CustomeTile.dart';
import 'package:flutter/material.dart';

class StudentCourseDrawer extends StatelessWidget {
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
              myIcon: Icons.article_sharp,
              txt: "Materials",
              isTeacher: false,
            ),
            CustomeTile(
              myIcon: Icons.assignment,
              txt: "Assignments",
              isTeacher: false,
            ),
            CustomeTile(
              myIcon: Icons.all_inbox,
              txt: "Announcements",
              isTeacher: false,
            ),
            CustomeTile(
              myIcon: Icons.assignment_returned_sharp,
              txt: "Quizes",
              isTeacher: false,
            ),
          ],
        ),
      ),
    );
  }
}
