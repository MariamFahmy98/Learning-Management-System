import 'package:cloud_firestore/cloud_firestore.dart';

class Assignment
{
  String title;
  String pdfURL;
  String grade;
  Timestamp deadline;

  Assignment({this.title, this.pdfURL, this.grade, this.deadline});
}