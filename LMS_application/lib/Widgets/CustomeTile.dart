import 'package:LMS_application/Screens/Student/Announcement/StudentAnnouncements.dart';
import 'package:LMS_application/Screens/Student/Assignments/StudentAssignments.dart';
import 'package:LMS_application/Screens/Student/Available_courses/students_avalabile_courses.dart';
import 'package:LMS_application/Screens/Student/Discussion/StudentDiscussion.dart';
import 'package:LMS_application/Screens/Student/Registered_courses/StudentCourses.dart';
import 'package:LMS_application/Screens/Teacher/Announcement/TeacherAnnouncements.dart';
import 'package:LMS_application/Screens/Teacher/Assignments/TeacherAssignments.dart';
import 'package:LMS_application/Screens/Teacher/Course/teacher_courses.dart';
import 'package:LMS_application/Screens/Teacher/Quiz/TeacherQuize.dart';
import 'package:LMS_application/models/User.dart';
import 'package:LMS_application/models/quiz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomeTile extends StatefulWidget {
  final IconData myIcon;
  final String txt;
  final Function tap;
  final bool isTeacher;
  User user;

  CustomeTile({this.myIcon, this.txt, this.tap, this.isTeacher, this.user});

  @override
  _CustomeTileState createState() => _CustomeTileState();
}

class _CustomeTileState extends State<CustomeTile> {
  Map<String, Widget> teacherScreens;

  Map<String, Widget> studentScreens;

  @override
  void initState() {
    teacherScreens = {
      'Assignments': TeacherAssignments(),
      'Announcements': TeacherAnnouncements(),
      'Courses': TeacherCourses(),
      'Quiz': TeacherQuize(),
      //'Library' : Library(),
      'LogOut': LogOut(),
    };
    studentScreens = {
      'Assignments': StudentAssignments(),
      'Announcements': StudentAnnouncements(),
      'My Courses': StudentCourses(widget.user),
      'Discussion': StudentDiscussion(widget.user),
      'Available Courses': StudentAvalabileCourse(),
      //'Info' : Info(),
      //'Library' : Library(),
      'LogOut': LogOut(),
    };
    super.initState();
  }

  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return widget.isTeacher
            ? teacherScreens[widget.txt]
            : studentScreens[widget.txt];
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
              Icon(widget.myIcon),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.txt,
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
