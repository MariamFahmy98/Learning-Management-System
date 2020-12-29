import 'package:LMS_application/Screens/Student/Announcement/StudentAnnouncements.dart';
import 'package:LMS_application/Screens/Student/Assignments/StudentAssignments.dart';
import 'package:LMS_application/Screens/Student/Available_courses/students_avalabile_courses.dart';
import 'package:LMS_application/Screens/Student/Discussion/StudentDiscussion.dart';
import 'package:LMS_application/Screens/Teacher/Announcement/TeacherAnnouncements.dart';
import 'package:LMS_application/Screens/Teacher/Assignments/TeacherAssignments.dart';
import 'package:LMS_application/Screens/Teacher/Course/teacher_courses.dart';
import 'package:LMS_application/Screens/Teacher/Discussion/TeacherDiscussion.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Screens/Teacher/library/Libraryp.dart';
import 'package:LMS_application/Screens/Student/Library/studentLibrary.dart';

class CustomeTile extends StatelessWidget {
  final IconData myIcon;
  final String txt;
  final Function tap;
  final bool isTeacher;
  CustomeTile({this.myIcon, this.txt, this.tap, this.isTeacher});

  final Map<String, dynamic> teacherScreens = {
    'Assignments': TeacherAssignments(),
    'Announcements': TeacherAnnouncements(),
    'Courses': TeacherCourses(),
    'Discussion': TeacherDiscussionForm(),
    //'Info' : Info(),
    'Library': Library(),
    'LogOut': () => FirebaseAuth.instance.signOut(),
  };

  final Map<String, dynamic> studentScreens = {
    'Assignments': StudentAssignments(),
    'Announcements': StudentAnnouncements(),
    //'My Courses': StudentCourses(),
    'Discussion': StudentDiscussionForm(),
    'Available Courses': StudentAvalabileCourse(),
    //'Info' : Info(),
    'Library': SLibrary(),
    'LogOut': () => FirebaseAuth.instance.signOut(),
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
        onTap: (txt == 'LogOut')? teacherScreens[txt] : () => selectScreen(context),
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
