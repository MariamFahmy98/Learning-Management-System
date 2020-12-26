import 'package:flutter/material.dart';
import '../../Widgets/CustomeTile.dart';

class StudentDrawer extends StatelessWidget {
  Function ontap;

  StudentDrawer(this.ontap);
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
            tap: () => {},
            isTeacher: false,
          ),
          CustomeTile(
            myIcon: Icons.assignment_sharp,
            txt: "My Courses",
            tap: () => {},
            isTeacher: false,
          ),
          CustomeTile(
            myIcon: Icons.assignment_turned_in,
            txt: "Available Courses",
            tap: () => {},
            isTeacher: false,
          ),
          CustomeTile(
            myIcon: Icons.chat,
            txt: "Discussion",
            tap: () => {},
            isTeacher: false,
          ),
          CustomeTile(
            myIcon: Icons.library_books,
            txt: "Library",
            tap: () => {},
            isTeacher: false,
          ),
          CustomeTile(
            myIcon: Icons.logout,
            txt: "LogOut",
            tap: () => {},
            isTeacher: false,
          ),
        ]),
      ),
    );
  }
}