import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  CourseCard(this.course);

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
                course.courseCode,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        title: Text(
          course.courseName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.courseDescription,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Credit hours: ' + course.courseCreditHours + 'h',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
