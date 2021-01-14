import 'package:LMS_application/models/QuizQuestion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseServices {
  Future<void> addQuizData(String title, String des, int duration,
      String quizId, String courseId, DateTime deadline) async {
    await FirebaseFirestore.instance
        .collection("Courses")
        .doc(courseId)
        .collection("Quizes")
        .doc(quizId)
        .set({
      "quizDes": des,
      "quizDuration": duration,
      "quizId": quizId,
      "quizTitle": title,
      "deadline": Timestamp.fromDate(deadline),
    }).catchError((e) {
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
    return FirebaseFirestore.instance
        .collection("Courses")
        .doc(courseId)
        .collection("Quizes")
        .snapshots();
  }

  getQuizQuestionData(String quizId) async {
    return FirebaseFirestore.instance
        .collection("Quizes")
        .doc(quizId)
        .collection("QNA")
        // ignore: deprecated_member_use
        .getDocuments();
  }

  QuizQuestion getQuestionFromSnapshot(DocumentSnapshot questionSnapshot) {
    QuizQuestion quizQuestion = new QuizQuestion();

    quizQuestion.question = questionSnapshot.data()["question"];

    List<String> options = [
      questionSnapshot.data()["option1"],
      questionSnapshot.data()["option2"],
      questionSnapshot.data()["option3"],
      questionSnapshot.data()["option4"],
    ];

    options.shuffle();

    quizQuestion.option1 = options[0];
    quizQuestion.option2 = options[1];
    quizQuestion.option3 = options[2];
    quizQuestion.option4 = options[3];

    quizQuestion.correctOption = questionSnapshot.data()["option1"];

    return quizQuestion;
  }
}