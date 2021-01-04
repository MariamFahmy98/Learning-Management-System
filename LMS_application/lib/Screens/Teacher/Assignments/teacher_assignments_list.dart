import 'package:LMS_application/Screens/Teacher/Assignments/pdf_viewer.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';


class TeacherAssignmentsList extends StatelessWidget {
  final Course course;

  TeacherAssignmentsList(this.course);

  void _openPDF(BuildContext context , String url) 
  {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) {
        return PDFViewer(url);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${course.courseCode} - Assignments'),
      ),
      body: Center(
        child: (course.assignmentIDs.length == 0)
            ? Text("No Avaliable Assignments")
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  return StreamBuilder(
                    stream: Database(course.courseCode)
                        .getAssignmentData(course.assignmentIDs[index]),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) return CircularProgressIndicator();
                      var assignmentData = snapshot.data;
                      return Column(
                        children: [
                          Text(assignmentData.title),
                          Text(assignmentData.grade),
                          RaisedButton(onPressed: () => _openPDF(context, assignmentData.pdfURL))
                        ],
                      );
                    },
                  );
                },
                itemCount: course.assignmentIDs.length,
              ),
      ),
    );
  }
}
