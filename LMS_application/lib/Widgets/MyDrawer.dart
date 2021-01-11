import 'package:flutter/material.dart';
import './CustomeTile.dart';

class MyDrawer extends StatelessWidget {
  Function ontap;

  MyDrawer(this.ontap);
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
          /*CustomeTile(
            myIcon: Icons.person,
            txt: "Person",
            tap: () => {},
          ),*/
          /*CustomeTile(
            myIcon: Icons.book,
            txt: "MyCourses",
            tap: () => {},
          ),*/
          CustomeTile(
            myIcon: Icons.notifications,
            txt: "Announcements",
            onTap: () => {},
          ),
          /* CustomeTile(
            myIcon: Icons.grade,
            txt: "Grades",
            tap: () => {},
          ),
          CustomeTile(
            myIcon: Icons.assignment_sharp,
            txt: "Quizes",
            tap: () => {},
          ),*/
          CustomeTile(
            myIcon: Icons.pages_outlined,
            txt: "Assignments",
            onTap: () => {},
          ),
          CustomeTile(
            myIcon: Icons.logout,
            txt: "LogOut",
            onTap: () => {},
          ),
          CustomeTile(
            myIcon: Icons.chat,
            txt: "Discussion",
            onTap: () => {},
          ),
        ]),
      ),
    );
  }
}
