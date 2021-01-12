import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class TeacherRequestsPage extends StatelessWidget {
  final Course course;
  TeacherRequestsPage(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseCode + ' Requests'),
      ),
      body: course.requests.length == 0
          ? Text(
              'No Requests found for this Course.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          : Container(
              height: 600,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return StreamBuilder<Object>(
                      stream: Database(course.requests[index]).studentData,
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();
                        Student student = snapshot.data;
                        return Card(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            elevation: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  student.name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(student.name +
                                    ' has requested to join ' +
                                    course.courseName +
                                    ' (' +
                                    course.courseCode +
                                    ') course.'),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    FlatButton(
                                      child: Text(
                                        'Approve',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      onPressed: () {},
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'Disapprove',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ));
                      });
                },
                itemCount: course.requests.length,
              ),
            ),
    );
  }
}
