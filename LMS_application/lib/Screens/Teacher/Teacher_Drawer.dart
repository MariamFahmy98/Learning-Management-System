import 'package:LMS_application/Screens/Teacher/Announcement/TeacherAnnouncements.dart';
import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class TeacherDrawer extends StatelessWidget {
  final Function ontap;

  TeacherDrawer(this.ontap);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(children: <Widget>[
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
            isTeacher: true,
          ),
          CustomeTile(
            myIcon: Icons.assignment_sharp,
            txt: "Courses",
            isTeacher: true,
          ),
          CustomeTile(
            myIcon: Icons.chat,
            txt: "Discussion",
            isTeacher: true,
          ),
          CustomeTile(
            myIcon: Icons.library_books,
            txt: "Library",
            isTeacher: true,
          ),
          CustomeTile(
            myIcon: Icons.logout,
            txt: "LogOut",
            isTeacher: true,
          ),
        ]),
      ),
    );
  }
}
