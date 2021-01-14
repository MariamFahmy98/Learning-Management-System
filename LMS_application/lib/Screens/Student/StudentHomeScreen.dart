<<<<<<< HEAD
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Screens/Student/Student_Drawer.dart';
=======
import 'package:LMS_application/Screens/Student/Registered_courses/StudentCourses.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
>>>>>>> sharnoby

class StudentHomeScreen extends StatelessWidget {
  final String _studentID;

  StudentHomeScreen(this._studentID);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Student>(
      stream: Database(_studentID).studentData,
      builder: (context, snapshot) {
<<<<<<< HEAD
        if (!snapshot.hasData) return CircularProgressIndicator();

        var student = snapshot.data;
        return Scaffold(
          drawer: StudentDrawer(student),
          appBar: AppBar(
            title: Text("Flutter Chat"),
          ),
          body: Container(),
        );
=======
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

        var student = snapshot.data;
        return StudentCourses(student);
>>>>>>> sharnoby
      },
    );
  }
}
