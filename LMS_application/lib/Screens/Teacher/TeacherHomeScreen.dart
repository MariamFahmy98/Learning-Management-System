import 'package:LMS_application/Screens/Teacher/Teacher_Drawer.dart';
import 'package:LMS_application/Widgets/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TeacherHomeScreen extends StatelessWidget {
  String teacherId;
  TeacherHomeScreen(@required this.teacherId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherDrawer(() => {}),
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
        child: Text(
          'Hello, Teacher',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
