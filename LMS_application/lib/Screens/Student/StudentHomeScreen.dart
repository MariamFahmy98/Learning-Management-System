import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Screens/Student/Student_Drawer.dart';

class StudentHomeScreen extends StatelessWidget {
  final String _studentID;

  StudentHomeScreen(this._studentID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: StudentDrawer(() => {}),
      appBar: AppBar(
        title: Text("Flutter Chat"),
      ),
      body: Container(
        child: StreamBuilder(
          stream: Database(_studentID).studentData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            var studentData = snapshot.data;
            return Text(
              "Hello " + studentData.name + " Student",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
