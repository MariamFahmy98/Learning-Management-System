import 'dart:async';

import 'package:LMS_application/Screens/PDF_Viewer/pdf_viewer.dart';
import 'package:LMS_application/models/Assignmet.dart';
import 'package:LMS_application/models/assignment_submission.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class StudentAssignmentCard extends StatefulWidget {
  final Key key;
  final Student student;
  final Assignment assignment;
  final String courseCode;

  StudentAssignmentCard({
    @required this.key,
    @required this.student,
    @required this.courseCode,
    @required this.assignment,
  });

  @override
  _StudentAssignmentCardState createState() => _StudentAssignmentCardState();
}

class _StudentAssignmentCardState extends State<StudentAssignmentCard> {
  int submissionState = 0;
  bool deadlinePassed;
  Timer timer;

  @override
  void initState() {
    super.initState();
    if (DateTime.now().isBefore(widget.assignment.deadline)) {
      deadlinePassed = false;
      timer = Timer(
        widget.assignment.deadline.difference(DateTime.now()),
        () => setState(() => deadlinePassed = true),
      );
    } else
      deadlinePassed = true;
  }

  void _openPDF(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(widget.assignment.pdfURL, widget.assignment.title);
      }),
    );
  }

  void _submitAssignment() async {
    var submissionFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (submissionFile == null) return;

    setState(() => submissionState = 1);

    await Database(widget.courseCode).uploadAssignmentSubmission(
      assignmentID: widget.assignment.id,
      pdfFile: submissionFile,
      studentID: widget.student.id,
    );
  }

  String _getSubmissionState() {
    if (submissionState == 0)
      return "Not Submitted.";
    else if (submissionState == 1)
      return "Submitting...";
    else if (submissionState == 2)
      return "Submitted.";
    else
      return "Graded.";
  }

  Widget _getSubmissionStateWidget() {
    if (submissionState == 0 && !deadlinePassed)
      return RaisedButton(
        onPressed: _submitAssignment,
        child: Text(
          "Submit",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        color: Colors.white,
        elevation: 50,
      );
    else if (submissionState == 1)
      return CircularProgressIndicator();
    else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: Database(widget.courseCode)
            .getAssignmentSubmission(widget.assignment.id, widget.student.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          AssignmentSubmission assignmentSubmission = snapshot.data;
          if (assignmentSubmission.valid && assignmentSubmission.graded)
            submissionState = 3;
          else if (assignmentSubmission.valid) submissionState = 2;

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
                    'Status: ${_getSubmissionState()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  if (submissionState == 3)
                    Text(
                      'Recieved Grade: ${assignmentSubmission.grade}',
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
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        color: Colors.white,
                        elevation: 50,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      _getSubmissionStateWidget(),
                    ],
                  )
                ],
              ),
            ]),
          );
        });
  }
}
