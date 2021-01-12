import 'package:flutter/material.dart';

class AssignmentSubmission {
  bool valid;
  String studentID;
  String grade;
  bool graded;
  DateTime submittedAt;
  String pdfURL;

  AssignmentSubmission({
    @required this.valid,
    this.studentID,
    this.graded,
    this.grade,
    this.submittedAt,
    this.pdfURL,
  });
}
