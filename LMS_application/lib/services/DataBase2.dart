import 'dart:io';

import 'package:LMS_application/models/Assignmet.dart';
import 'package:LMS_application/models/assignment_submission.dart';
<<<<<<< HEAD
import 'package:LMS_application/models/course.dart';
=======
import 'package:LMS_application/models/material.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/officehours.dart';
>>>>>>> sharnoby
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
=======


>>>>>>> sharnoby

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
<<<<<<< HEAD
=======
      requests: snapshot.data()['Requests'].cast<String>().toList(),
>>>>>>> sharnoby
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

<<<<<<< HEAD
=======
////////////////////////////////////////////////////////////////////////////////
  List<Course> _courseAllDataFromSnapshot(QuerySnapshot querySnapshot) {
    var snapshots = querySnapshot.docs;
    List<Course> courses = List(snapshots.length);
    for (int i = 0; i < snapshots.length; i++) {
      var snapshotData = snapshots[i].data();
      courses[i] = Course(
        courseCode: snapshots[i].id,
        courseCreditHours: snapshotData['Credit Hours'],
        courseDescription: snapshotData['Description'],
        courseName: snapshotData['Name'],
        requests: snapshotData['Requests'].cast<String>().toList(),
      );
    }
    return courses;
  }

  Stream<List<Course>> get allCoursesData {
    return FirebaseFirestore.instance
        .collection('Courses')
        .snapshots()
        .map(_courseAllDataFromSnapshot);
  }

  Future<void> requestCourse(String studentId, Course course) async {
    course.requests.add(studentId);

    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .set({'Requests': course.requests}, SetOptions(merge: true));
  }

  Future<void> remveStudentFromRequestsList(
      String studentId, Course course) async {
    course.requests.removeWhere((item) => item == studentId);
    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .set({'Requests': course.requests}, SetOptions(merge: true));
  }

  Future<void> addStudentToCourse(Student student, Course course) async {
    student.courses.add(course.courseCode);
    await FirebaseFirestore.instance
        .collection('Students')
        .doc(documentID)
        .set({'Courses': student.courses}, SetOptions(merge: true));
  }

/////////////////////////////////////////////////////////////////////////////

  List<Officehour> _officehourDataFromSnapshot(QuerySnapshot querySnapshot) {
    var snapshots = querySnapshot.docs;
    List<Officehour> officehours = List(snapshots.length);
    for (int i = 0; i < snapshots.length; i++) {
      var snapshotData = snapshots[i].data();
      officehours[i] = Officehour(
        place: snapshotData['place'],
        name: snapshotData['name'],
        appointment: snapshotData['appointment'].toDate(),
      );
    }

    return officehours;
  }

  Stream<List<Officehour>> get officehoursData {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Officehours')
        .snapshots()
        .map(_officehourDataFromSnapshot);
  }

  List<Materiala> _materialDataFromSnapshot(QuerySnapshot querySnapshot) {
    var snapshots = querySnapshot.docs;
    List<Materiala> materials = List(snapshots.length);
    for (int i = 0; i < snapshots.length; i++) {
      var snapshotData = snapshots[i].data();
      materials[i] = Materiala(
        title: snapshotData['title'],
        link: snapshotData['link'],
      );
    }

    return materials;
  }

  Stream<List<Materiala>> get materialsData {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Materials')
        .snapshots()
        .map(_materialDataFromSnapshot);
  }

  Future<void> uploadMaterial({
    @required String title,
    @required String link,
    //@required DateTime deadline,
    //@required File pdfFile,
  }) async {
    //var filename = documentID + title + pdfFile.path.split("/").last;
    //final ref = FirebaseStorage.instance.ref().child(filename);

    //await ref.putFile(pdfFile).whenComplete(() => print('Upload Complete.'));
    //final url = await ref.getDownloadURL();

    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Materials')
        .add({
      'title': title,
      'link': link,
      //'deadline': Timestamp.fromDate(deadline),
      //'pdfURL': url,
    });
  }

>>>>>>> sharnoby
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

<<<<<<< HEAD
  AssignmentSubmission _assignmentSubmissionDataFromSnapshot(
      DocumentSnapshot snapshot) {
    if (!snapshot.exists)
      return AssignmentSubmission(valid: false);

    var snapshotData = snapshot.data();
=======
  Future<void> uploadOfficehour({
    @required String place,
    @required String name,
    @required DateTime appointment,
  }) async {
    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Officehours')
        .add({
      'place': place,
      'name': name,
      'appointment': Timestamp.fromDate(appointment),
    });
  }

  AssignmentSubmission _assignmentSubmissionDataFromSnapshot(
      DocumentSnapshot snapshot) {
    if (!snapshot.exists) return AssignmentSubmission(valid: false);

    var snapshotData = snapshot.data();
    var ab = (snapshot.data()["pdfURL"]);
    ab.toUri(ab);

>>>>>>> sharnoby
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
<<<<<<< HEAD
      'grade': "0",
      'graded': false,
    });
  }
}
=======
      'grade': "",
      'graded': false,
    });
  }

  List<AssignmentSubmission> _allAssignmentSubmissionsFromSnapshot(
      QuerySnapshot querySnapshot) {
    return querySnapshot.docs
        .map(_assignmentSubmissionDataFromSnapshot)
        .toList();
  }

  Stream<List<AssignmentSubmission>> getAllAssignmentSubmissions(
      String assignmentID) {
    return FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Assignments')
        .doc(assignmentID)
        .collection('Submissions')
        .snapshots()
        .map(_allAssignmentSubmissionsFromSnapshot);
  }

  Future<void> setAssignmentSubmissionGrade({
    @required String assignmentID,
    @required String studentID,
    @required String grade,
  }) async {
    await FirebaseFirestore.instance
        .collection('Courses')
        .doc(documentID)
        .collection('Assignments')
        .doc(assignmentID)
        .collection('Submissions')
        .doc(studentID)
        .set({'graded': true, 'grade': grade}, SetOptions(merge: true));
  }
}

>>>>>>> sharnoby
