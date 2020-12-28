import 'package:LMS_application/Screens/Student/Announcement/StudentAnnouncements.dart';
import 'package:LMS_application/Screens/Student/Assignments/StudentAssignments.dart';
import 'package:LMS_application/Screens/Student/Available_courses/students_avalabile_courses.dart';
import 'package:LMS_application/Screens/Student/Discussion/StudentDiscussion.dart';
import 'package:LMS_application/Screens/Student/Registered_courses/StudentCourses.dart';
import 'package:LMS_application/Screens/Teacher/Announcement/TeacherAnnouncements.dart';
import 'package:LMS_application/Screens/Teacher/Assignments/TeacherAssignments.dart';
import 'package:LMS_application/Screens/Teacher/Course/teacher_courses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomeTile extends StatelessWidget {
  IconData myIcon;
  String txt;
  Function tap;
  bool isTeacher;
  CustomeTile({this.myIcon, this.txt, this.tap, this.isTeacher});

  Map<String, Widget> teacherScreens = {
    'Assignments': TeacherAssignments(),
    //'Announcements': TeacherAnnouncements('Q5bXLrgLKDvlXjZdM8Nn'),
    'Courses': TeacherCourses(),
    //'Info' : Info(),
    //'Library' : Library(),
    'LogOut': LogOut(),
  };

  Map<String, Widget> studentScreens = {
    'Assignments': StudentAssignments(),
    'Announcements': StudentAnnouncements(),
    //'My Courses': StudentCourses(),
    'Discussion': StudentDiscussion(),
    'Available Courses': StudentAvalabileCourse(),
    //'Info' : Info(),
    //'Library' : Library(),
    'LogOut': LogOut(),
  };
  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return isTeacher ? teacherScreens[txt] : studentScreens[txt];
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        onTap: () => selectScreen(context),
        splashColor: Colors.purple,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Icon(myIcon),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  txt,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        child: Text('mmm'),
        onPressed: () {
          FirebaseAuth.instance.signOut();
        });
  }
}
