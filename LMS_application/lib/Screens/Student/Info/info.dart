import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/Screens/PDF_Viewer/pdf_viewer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentInfo extends StatefulWidget {
  final Student student;
  StudentInfo(this.student);
  @override
  _StudentInfoState createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  String text = 'No File Chosen';
  String pathPDF = "";

  void _openPDF(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(pathPDF, "");
      }),
    );
  }

  void _submitCV() async {
    var submissionFile = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    FirebaseFirestore.instance
        .collection("/Students/Info")
        .add({"PDFfile": submissionFile});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'CV Uploader and Viewer',
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.purple,
              child: Text(
                'Pick File',
              ),
              onPressed: _submitCV,
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.purple,
              child: Text(
                'View File',
              ),
              onPressed: () => _openPDF(context),
            ),
          ],
        ),
      ),
    );
  }
}