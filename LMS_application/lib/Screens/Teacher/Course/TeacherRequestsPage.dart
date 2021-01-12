import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class TeacherRequestsPage extends StatefulWidget {
  final Course course;
  TeacherRequestsPage(this.course);

  @override
  _TeacherRequestsPageState createState() => _TeacherRequestsPageState(course);
}

class _TeacherRequestsPageState extends State<TeacherRequestsPage> {
  final Course course;
  _TeacherRequestsPageState(this.course);

  void _reloadRequestList(String studentId) {
    setState(() {
      course.requests.removeWhere((item) => item == studentId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.course.courseCode + ' Requests'),
      ),
      body: widget.course.requests.length == 0
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
                      stream:
                          Database(widget.course.requests[index]).studentData,
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
                                    widget.course.courseName +
                                    ' (' +
                                    widget.course.courseCode +
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
                                      onPressed: () {
                                        Database(student.id).addStudentToCourse(
                                            student, widget.course);
                                        Database(widget.course.courseCode)
                                            .remveStudentFromRequestsList(
                                                student.id, widget.course);
                                        _reloadRequestList(student.id);
                                      },
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'Disapprove',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      color: Theme.of(context).accentColor,
                                      onPressed: () {
                                        Database(widget.course.courseCode)
                                            .remveStudentFromRequestsList(
                                                student.id, widget.course);
                                        _reloadRequestList(student.id);
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ));
                      });
                },
                itemCount: widget.course.requests.length,
              ),
            ),
    );
  }
}
