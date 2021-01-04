import 'package:LMS_application/models/Assignmet.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  String documentID;

  Database(this.documentID);

  Student _studentDataFromSnapshot(DocumentSnapshot snapshot) {
    return Student(
      id: documentID,
      name: snapshot.data['Name'],
      courses: snapshot.data['Courses'].cast<String>().toList(),
    );
  }

  Stream<Student> get studentData {
    return Firestore.instance
        .collection('Students')
        .document(documentID)
        .snapshots()
        .map(_studentDataFromSnapshot);
  }

  Teacher _teacherDataFromSnapshot(DocumentSnapshot snapshot) {
    return Teacher(
      id: documentID,
      name: snapshot.data['Name'],
      courses: snapshot.data['Courses'].cast<String>().toList(),
    );
  }

  Stream<Teacher> get teacherData {
    return Firestore.instance
        .collection('Teachers')
        .document(documentID)
        .snapshots()
        .map(_teacherDataFromSnapshot);
  }

  Course _courseDataFromSnapshot(DocumentSnapshot snapshot) {
    return Course(
      courseCode: documentID,
      courseCreditHours: snapshot.data['Credit Hours'],
      courseDescription: snapshot.data['Description'],
      courseName: snapshot.data['Name'],
      assignmentIDs: snapshot.data['AssignmentsIDs'].cast<String>().toList(),
    );
  }

  Stream<Course> get courseData {
    return Firestore.instance
        .collection('Courses')
        .document(documentID)
        .snapshots()
        .map(_courseDataFromSnapshot);
  }

  Assignment _assignmentDataFromSnapshot(DocumentSnapshot snapshot) {
    return Assignment(
        title: snapshot.data['title'],
        pdfURL: snapshot.data['pdfURL'],
        grade: snapshot.data['grade'],
        deadline: snapshot.data['deadline']);
  }

  Stream<Assignment> getAssignmentData(String assignmentID) {
    return Firestore.instance
        .collection('Courses')
        .document(documentID)
        .collection('Assignments')
        .document(assignmentID)
        .snapshots()
        .map(_assignmentDataFromSnapshot);
  }
}
