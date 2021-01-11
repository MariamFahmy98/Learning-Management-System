import 'package:LMS_application/Screens/Teacher/Assignments/submissions_list.dart';
import 'package:LMS_application/models/Assignmet.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../../PDF_Viewer/pdf_viewer.dart';

class TeacherAssignmentCard extends StatelessWidget {
  TeacherAssignmentCard(
      {@required this.courseCode, @required this.assignmentData});

  final Assignment assignmentData;
  final String courseCode;

  void _openPDF(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(assignmentData.pdfURL, assignmentData.title);
      }),
    );
  }

  void _viewSubmissions(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return SubmissionsList(
          courseCode: courseCode,
          assignmentTitle: assignmentData.title,
          assignmentID: assignmentData.id,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: Theme.of(context).primaryColor,
      child: Row(children: [
        Icon(
          Icons.assignment_turned_in,
          size: 60,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              assignmentData.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Grade: ${assignmentData.grade} Marks.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Deadline: " +
                  DateFormat.MMMEd().format(assignmentData.deadline) +
                  "  " +
                  DateFormat.jm().format(assignmentData.deadline),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: () => _openPDF(context),
                  child: Text(
                    "View Assignment",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  color: Colors.white,
                  elevation: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  onPressed: () => _viewSubmissions(context),
                  child: Text(
                    "View Submissions",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  color: Colors.white,
                  elevation: 50,
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
