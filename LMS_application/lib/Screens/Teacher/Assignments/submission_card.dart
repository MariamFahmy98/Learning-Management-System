import 'package:LMS_application/Screens/PDF_Viewer/pdf_viewer.dart';
import 'package:LMS_application/models/assignment_submission.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SubmissionCard extends StatelessWidget {
  final String courseCode;
  final String assignmentID;
  final AssignmentSubmission submission;
  final _gradeController = TextEditingController();

  SubmissionCard(this.courseCode, this.assignmentID, this.submission);

  void _openPDF(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(submission.pdfURL, submission.studentID);
      }),
    );
  }

  void _setSubmissionGrade(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: TextField(
            decoration: InputDecoration(labelText: 'Grade'),
            controller: _gradeController,
            keyboardType: TextInputType.number,
            onSubmitted: (gradeString) async {
              Navigator.of(ctx).pop();
              var grade = double.parse(gradeString, (source) => -1);
              if (grade < 0)
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Error: Enter a valid grade please!'),
                    backgroundColor: Theme.of(context).errorColor,
                  ),
                );
              else
                await Database(courseCode).setAssignmentSubmissionGrade(
                  assignmentID: assignmentID,
                  studentID: submission.studentID,
                  grade: grade.toStringAsFixed(2),
                );
            },
          ),
        );
      },
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
          Icons.subject,
          size: 60,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4,
            ),
            Text(
              "Submittied At: " +
                  DateFormat.MMMEd().format(submission.submittedAt) +
                  "  " +
                  DateFormat.jm().format(submission.submittedAt),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Given Grade: ${submission.grade} Marks.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: [
                RaisedButton(
                  onPressed: () => _openPDF(context),
                  child: Text(
                    "View Submission",
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  color: Colors.white,
                  elevation: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                RaisedButton(
                  onPressed: () => _setSubmissionGrade(context),
                  child: Text(
                    "Set Grade",
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
