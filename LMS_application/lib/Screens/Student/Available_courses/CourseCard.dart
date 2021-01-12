import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatefulWidget {
  final Course course;
  final Student student;
  CourseCard({this.course, this.student});

  @override
  _CourseCardState createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  String request = 'Request Course';

  void _showRequestSend() {
    setState(() {
      request = 'Requested';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      elevation: 15,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FittedBox(
              child: Text(
                widget.course.courseCode,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          widget.course.courseName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.course.courseDescription,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Credit hours: ' + widget.course.courseCreditHours + 'h',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            (!widget.student.courses.contains(widget.course.courseCode))
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                        child: (!widget.course.requests
                                .contains(widget.student.id))
                            ? Text(
                                request,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            : Text(
                                'Requested',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          if (!widget.course.requests
                              .contains(widget.student.id)) {
                            Database(widget.course.courseCode).requestCourse(
                                widget.student.id, widget.course);
                            _showRequestSend();
                          }
                        },
                      ),
                    ],
                  )
                : Text(''),
          ],
        ),
      ),
    );
  }
}
