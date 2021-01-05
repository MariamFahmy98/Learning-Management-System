import 'package:LMS_application/Screens/PDF_Viewer/pdf_viewer.dart';
import 'package:LMS_application/models/Assignmet.dart';
import 'package:LMS_application/models/student.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentAssignmentCard extends StatefulWidget {
  final Student student;
  final Assignment assignment;

  StudentAssignmentCard({
    @required this.student,
    @required this.assignment,
  });

  @override
  _StudentAssignmentCardState createState() => _StudentAssignmentCardState();
}

class _StudentAssignmentCardState extends State<StudentAssignmentCard> {
  void _openPDF(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(widget.assignment.pdfURL, widget.assignment.title);
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
              widget.assignment.title,
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
              "Grade: ${widget.assignment.grade} Marks.",
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
                  DateFormat.MMMEd().format(widget.assignment.deadline) +
                  "  " +
                  DateFormat.jm().format(widget.assignment.deadline),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'Status: Not Submitted',
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
                    "Submit",
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
