import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'pdf_viewer.dart';

class TeacherAssignmentCard extends StatelessWidget {
  TeacherAssignmentCard({@required this.assignmentData});

  final assignmentData;

  void _openPDF(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(assignmentData.pdfURL, assignmentData.title);
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
                  onPressed: () {},
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
