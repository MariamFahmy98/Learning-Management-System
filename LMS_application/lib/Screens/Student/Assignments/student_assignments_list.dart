import 'package:LMS_application/Screens/Student/Assignments/student_assignment_card.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class StudentAssignmentsList extends StatelessWidget {
  final Course course;
  final Student student;

  StudentAssignmentsList(this.student, this.course);

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
            print(snapshot.error);
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
                    itemBuilder: (ctx, index) => StudentAssignmentCard(
                      student: student,
                      assignment: assignments[index],
                    ),
                    itemCount: assignments.length,
                  );
          },
        ),
      ),
    );
  }
}
