import 'package:flutter/material.dart';

import 'package:LMS_application/services/DataBase2.dart';
import 'package:LMS_application/models/course.dart';
import 'teacher_assignment_card.dart';

class TeacherAssignmentsList extends StatelessWidget {
  final Course course;

  TeacherAssignmentsList(this.course);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${course.courseCode} - Assignments'),
      ),
      body: Center(
        child: (course.assignmentIDs.length == 0)
            ? Text("No Avaliable Assignments")
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return StreamBuilder(
                    stream: Database(course.courseCode)
                        .getAssignmentData(course.assignmentIDs[index]),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      var assignmentData = snapshot.data;
                      return TeacherAssignmentCard(assignmentData: assignmentData);
                    },
                  );
                },
                itemCount: course.assignmentIDs.length,
              ),
      ),
    );
  }
}
