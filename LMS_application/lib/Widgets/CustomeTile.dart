import 'package:LMS_application/Screens/Announcements.dart';
import 'package:LMS_application/Screens/Assignments.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomeTile extends StatelessWidget {
  IconData myIcon;
  String txt;
  Function tap;

  Map<String, Widget> screens = {
    'Assignments': Assignments(),
    'Announcements': Announcements(),
    //'My Courses': MyCourses(),// registered courses
    //'Courses': MyCourses(),//teacher courses
    //'Available Courses' : AvailableCourses(),
    //'Info' : Info(),
    //'Library' : Library(),
    'LogOut': LogOut(),
  };
  CustomeTile({this.myIcon, this.txt, this.tap});

  void selectScreen(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(builder: (_) {
        return screens[txt];
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
