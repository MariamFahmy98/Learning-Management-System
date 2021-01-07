import 'dart:io';

import 'package:LMS_application/models/Assignmet.dart';
import 'package:LMS_application/models/assignment_submission.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Database {
  String documentID;

  Database(this.documentID);

  Student _studentDataFromSnapshot(DocumentSnapshot snapshot) {
    return Student(
      id: documentID,
      name: snapshot.data()['Name'],
      courses: snapshot.data()['Courses'].cast<String>().toList(),
    );
  }

  Stream<Student> get studentData {
    return FirebaseFirestore.instance
        .collection('Students')
        .doc(documentID)
        .snapshots()
        .map(_studentDataFromSnapshot);
  }

  Teacher _teacherDataFromSnapshot(DocumentSnapshot snapshot) {
    return Teacher(
      id: documentID,
      name: snapshot.data()['Name'],
      courses: snapshot.data()['Courses'].cast<String>().toList(),
    );
  }

  Stream<Teacher> get teacherData {
    return FirebaseFirestore.instance
        .collection('Teachers')
        .doc(documentID)
        .snapshots()
        .map(_teacherDataFromSnapshot);
  }

  Course _courseDataFromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      courseCode: documentID,
      courseCreditHours: snapshot.data()['Credit Hours'],
      courseDescription: snapshot.data()['Description'],
      courseName: snapshot.data()['Name'],
    );
  }

  Stream<Course> get courseData {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .snapshots()
        .map(_courseDataFromSnapshot);
  }

  List<Assignment> _assignmentDataFromSnapshot(QuerySnapshot querySnapshot) {
    var snapshots = querySnapshot.docs;
    List<Assignment> assignments = List(snapshots.length);
    for (int i = 0; i < snapshots.length; i++) {
      var snapshotData = snapshots[i].data();
      assignments[i] = Assignment(
        id: snapshots[i].id,
        title: snapshotData['title'],
        grade: snapshotData['grade'],
        deadline: snapshotData['deadline'].toDate(),
        pdfURL: snapshotData['pdfURL'],
      );
    }

    return assignments;
  }

  Stream<List<Assignment>> get assignmentsData {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Assignments')
        .snapshots()
        .map(_assignmentDataFromSnapshot);
  }

  Future<void> uploadAssignment({
    @required String title,
    @required String grade,
    @required DateTime deadline,
    @required File pdfFile,
  }) async {
    var filename = documentID + title + pdfFile.path.split("/").last;
    final ref = FirebaseStorage.instance.ref().child(filename);

    await ref.putFile(pdfFile).whenComplete(() => print('Upload Complete.'));
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Assignments')
        .add({
      'title': title,
      'grade': grade,
      'deadline': Timestamp.fromDate(deadline),
      'pdfURL': url,
    });
  }

  AssignmentSubmission _assignmentSubmissionDataFromSnapshot(
      DocumentSnapshot snapshot) {
    if (!snapshot.exists)
      return AssignmentSubmission(valid: false);

    var snapshotData = snapshot.data();
    return AssignmentSubmission(
      valid: true,
      studentID: snapshot.id,
      graded: snapshotData['graded'],
      grade: snapshotData['grade'],
      submittedAt: snapshotData['submittedAt'].toDate(),
      pdfURL: snapshotData['pdfURL'],
    );
  }

  Stream<AssignmentSubmission> getAssignmentSubmission(
      String assignmentID, String studentID) {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Assignments')
        .doc(assignmentID)
        .collection('Submissions')
        .doc(studentID)
        .snapshots()
        .map(_assignmentSubmissionDataFromSnapshot);
  }

  Future<void> uploadAssignmentSubmission(
      {@required File pdfFile,
      @required String assignmentID,
      @required String studentID}) async {
    var filename = studentID + assignmentID + '.pdf';
    final ref = FirebaseStorage.instance.ref().child(filename);

    await ref.putFile(pdfFile).whenComplete(() => print('Upload Complete.'));
    final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Assignments')
        .doc(assignmentID)
        .collection('Submissions')
        .doc(studentID)
        .set({
      'submittedAt': Timestamp.now(),
      'pdfURL': url,
      'grade': "0",
      'graded': false,
    });
  }
}
