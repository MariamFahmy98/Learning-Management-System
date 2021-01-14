import 'package:LMS_application/Screens/Teacher/Assignments/submission_card.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

class SubmissionsList extends StatelessWidget {
  final String courseCode;
  final String assignmentTitle;
  final String assignmentID;

  SubmissionsList({
    @required this.courseCode,
    @required this.assignmentTitle,
    @required this.assignmentID,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$assignmentTitle Submissions'),
      ),
      body: Center(
        child: StreamBuilder(
          stream:
              Database(courseCode).getAllAssignmentSubmissions(assignmentID),
          builder: (context, snapshot) {
            print(snapshot.error);
            if (!snapshot.hasData) return CircularProgressIndicator();
            var submissions = snapshot.data;
            print(submissions.length);
            return (submissions.length == 0)
                ? Text(
                    'No Submissions Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) =>
                        SubmissionCard(courseCode, assignmentID, submissions[index]),
                    itemCount: submissions.length,
                  );
          },
        ),
      ),
    );
  }
}
