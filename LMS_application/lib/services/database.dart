import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  Future<void> addQuizData(Map quizData, String quizId, String courseId) async {
    await Firestore.instance
        .collection("Courses")
        .document(courseId)
        .collection("Quizes")
        .document(quizId)
        .setData(quizData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addQuestionData(Map questionData, String quizId) async {
    await Firestore.instance
        .collection("Quizes")
        .document(quizId)
        .collection("QNA")
        .add(questionData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getQuizData(String courseId) async {
    return await Firestore.instance
        .collection("Courses")
        .document(courseId)
        .collection("Quizes")
        .snapshots();
  }
}
