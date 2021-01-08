import 'package:LMS_application/models/quiz.dart';
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

  getQuizesData(String courseId) async {
    return await FirebaseFirestore.instance
        .collection("Courses")
        .doc(courseId)
        .collection("Quizes")
        .snapshots();
  }

  getQuizData(String quizId) async {
    return await FirebaseFirestore.instance
        .collection("Quizes")
        .doc(quizId)
        .collection("QNA")
        // ignore: deprecated_member_use
        .getDocuments();
  }

  // Quiz _quizDataFromSnapshot(DocumentSnapshot snapshot, String quizID) {
  //   return Quiz(
  //     quizId: quizID,
  //     question: snapshot.data()["question"],
  //     option1: snapshot.data()["option1"],
  //     option2: snapshot.data()["option2"],
  //     option3: snapshot.data()["option3"],
  //     option4: snapshot.data()["option4"],
  //     duration: snapshot.data()['Name'],
  //   );
  // }

}
