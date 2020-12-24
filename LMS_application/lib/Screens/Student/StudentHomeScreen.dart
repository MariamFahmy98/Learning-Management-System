import 'package:LMS_application/Widgets/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentHomeScreen extends StatelessWidget {
  final String _studentID;

  StudentHomeScreen(this._studentID);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(() => {}),
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
          _studentID,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
