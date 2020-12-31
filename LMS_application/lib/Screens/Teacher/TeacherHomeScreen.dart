import 'package:LMS_application/Screens/Teacher/Teacher_Drawer.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class TeacherHomeScreen extends StatelessWidget {
  final String _teacherID;

  TeacherHomeScreen(this._teacherID);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Teacher>(
      stream: Database(_teacherID).teacherData,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        var teacher = snapshot.data;
        return Scaffold(
          drawer: TeacherDrawer(teacher),
          appBar: AppBar(
            title: Text("Flutter Chat"),
          ),
          body: Container(),
        );
      },
    );
  }
}
