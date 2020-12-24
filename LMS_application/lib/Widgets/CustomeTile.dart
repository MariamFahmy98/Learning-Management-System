import 'package:flutter/material.dart';

import '../Mustafa/MyCourses.dart';
import '../Screens/Announcements.dart';
import '../Screens/Assignments.dart';
import '../Screens/Grades.dart';
import '../Screens/Teacher/Quiz/Quize.dart';

class CustomeTile extends StatelessWidget {
  IconData myIcon;
  String txt;
  Function tap;

  Map<String, Widget> screens = {
    'MyCourses': MyCourses(),
    'Announcements': Announcements(),
    'Grades': Grades(),
    'Quizes': Quizes(),
    'Assignments': Assignments(),
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
