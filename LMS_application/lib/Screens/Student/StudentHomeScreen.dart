import 'package:LMS_application/Widgets/MyDrawer.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:LMS_application/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
