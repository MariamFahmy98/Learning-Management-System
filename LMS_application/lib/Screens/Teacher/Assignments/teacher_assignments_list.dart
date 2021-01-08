import 'package:LMS_application/Screens/Teacher/Assignments/new_assignment.dart';
import 'package:flutter/material.dart';

import 'package:LMS_application/services/DataBase2.dart';
import 'package:LMS_application/models/course.dart';
import 'teacher_assignment_card.dart';

class TeacherAssignmentsList extends StatelessWidget {
  final Course course;

  TeacherAssignmentsList(this.course);

  void _startAddNewAssignment(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => NewAssignment(course.courseCode),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${course.courseCode} - Assignments'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: Database(course.courseCode).assignmentsData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            var assignments = snapshot.data;
            return (assignments.length == 0)
                ? Text(
                    'No Assignments Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => TeacherAssignmentCard(
                      courseCode: course.courseCode,
                      assignmentData: assignments[index],
                    ),
                    itemCount: assignments.length,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewAssignment(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
