import 'dart:async';

import 'package:LMS_application/Screens/Student/Info/addCV.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/models/student.dart';
import 'package:url_launcher/url_launcher.dart';

bool cvState = false;

class StudentInfo extends StatefulWidget {
  final Student student;
  StudentInfo(this.student);
  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  String text = 'No File Chosen';
  String pathPDF = "";
  @override
  Widget build(BuildContext context) {
    cvState = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'CV Uploader and Viewer',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                color: Colors.purple,
                child: Text(
                  'Pick File',
                ),
                onPressed: () {
                  if (!cvState) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddCV()),
                    );
                    cvState = true;
                  }
                  Timer _timer;
                  _timer = new Timer(const Duration(milliseconds: 1000), () {
                    setState(() {
                      text = "CV Uploaded Successfully";
                      cvState = true;
                    });
                  });
                }),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.purple,
              child: Text(
                'View File',
              ),
              onPressed: () {
                  launch(link);
              },
            ),
          ],
        ),
      ),
    );
  }
}
