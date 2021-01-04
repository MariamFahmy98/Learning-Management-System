import 'package:LMS_application/Screens/Teacher/Course/TeacherCourseDrawer.dart';
import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';
import 'teacher_requests_list.dart';

class TeacherOpenCourse extends StatelessWidget {
  final Course runningCourse;
  TeacherOpenCourse(this.runningCourse);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TeacherCourseDrawer(runningCourse),
      appBar: AppBar(
        title: Text(runningCourse.courseCode),
        actions: [
          IconButton(
              icon: Icon(Icons.request_page),
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return RequestsPage();
                }));
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(5),
            child: Text(
              runningCourse.courseName + ' (' + runningCourse.courseCode + ')',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text(
              'Course description: -\n' +
                  runningCourse.courseDescription +
                  '\n \nCredit hours:- ' +
                  runningCourse.courseCreditHours +
                  'h',
              style: TextStyle(fontSize: 18),
            ),
          ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.stretch,
          //   children: <Widget>[
          //     Card(
          //       elevation: 5,
          //       child: Text(
          //         'Course materials: ',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     //will be list of material
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 60),
          //       child: FlatButton(
          //         child: Text('example'),
          //         color: Theme.of(context).primaryColor,
          //         onPressed: () {},
          //       ),
          //     ),
          //     Card(
          //       elevation: 5,
          //       child: Text(
          //         'Quizes: ',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     //will be list of Quizes
          //     Container(
          //       height: 100,
          //       child: Text('Add Quiz'), //QuizList(myQuizes: myQuizes),
          //     ),
          //     Card(
          //       elevation: 5,
          //       child: Text(
          //         'Assingments: ',
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     //Also will be a list
          //     Container(
          //       padding: EdgeInsets.symmetric(horizontal: 60),
          //       child: FlatButton(
          //         child: Text('Assignment 1'),
          //         color: Theme.of(context).primaryColor,
          //         onPressed: () {},
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
