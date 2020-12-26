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
}