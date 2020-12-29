import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Screens/Student/Student_Drawer.dart';

class StudentHomeScreen extends StatelessWidget {
  final String _studentID;

  StudentHomeScreen(this._studentID);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Student>(
        stream: Database(_studentID).studentData,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          var student = snapshot.data;
          return Scaffold(
            drawer: StudentDrawer(() => {}, student),
            appBar: AppBar(
              title: Text("Flutter Chat"),
              actions: [
                DropdownButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Theme.of(context).primaryIconTheme.color,
                  ),
                  items: [
                    DropdownMenuItem(
                      child: Container(
                        child: Row(
                          children: [
                            Icon(Icons.exit_to_app),
                            SizedBox(
                              width: 8,
                            ),
                            Text('logout'),
                          ],
                        ),
                      ),
                      value: 'logout',
                    ),
                  ],
                  onChanged: (itemIndentifier) {
                    if (itemIndentifier == 'logout') {
                      FirebaseAuth.instance.signOut();
                    }
                  },
                ),
              ],
            ),
            body: Container(),
          );
        });
  }
}
