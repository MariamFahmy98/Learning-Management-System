import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  Future<void> addQuizData(Map quizData, String quizId, String courseId) async {
    await FirebaseFirestore.instance
        .collection("Courses")
        .doc(courseId)
        .collection("Quizes")
        .doc(quizId)
        .set(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    await FirebaseFirestore.instance
        .collection("Quizes")
        .doc(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }
/*
  getQuizData() async {
    return await Firestore.instance.collection("quizes").snapshots();
  }*/
}
