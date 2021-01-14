import 'dart:async';

import 'package:LMS_application/Screens/Student/Quiz/QuestionTile.dart';
import 'package:LMS_application/Screens/Student/Quiz/Result.dart';
import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/models/QuizQuestion.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayQuizStudent extends StatefulWidget {
  final String quizId;
  final String quizTitle;
  final Course course;
  final DateTime quizDeadLine;
  final int duration;
  DateTime startTime;
  PlayQuizStudent({
    this.quizId,
    this.quizTitle,
    this.course,
    this.quizDeadLine,
    this.duration,
    this.startTime,
  });

  @override
  _PlayQuizStudentState createState() => _PlayQuizStudentState();
}

class _PlayQuizStudentState extends State<PlayQuizStudent> {
  bool isLoading = true;
  bool deadLinePassed = false;
  Timer timer1;
  Timer timer2;

  bool isSubmitted = false;
  DataBaseServices dataBaseServices = new DataBaseServices();
  QuerySnapshot questionSnapshot;
  QuizQuestion quiz;
  int correctAnswers;

  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    DateTime finishTime =
        widget.startTime.add(new Duration(minutes: widget.duration));
    print("${finishTime}");
    if (DateTime.now().isBefore(widget.quizDeadLine)) {
      deadLinePassed = false;
      timer1 = Timer(
        widget.quizDeadLine.difference(DateTime.now()),
        () => setState(() => deadLinePassed = true),
      );
    } else
      deadLinePassed = true;

    if (DateTime.now().isBefore(finishTime)) {
      isFinished = false;
      timer2 = Timer(
        finishTime.difference(DateTime.now()),
        () => setState(() => isFinished = true),
      );
    } else
      isFinished = true;

    print("${widget.quizId}");
    dataBaseServices.getQuizQuestionData(widget.quizId).then((value) {
      questionSnapshot = value;
      //if (quiz.isCorrect) correctAnswers++;
      setState(() {
        isLoading = false;
      });
    });
  }

  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       print("hey");
  //       if (widget.duration == 0) {
  //         setState(() {
  //           isFinished = true;
  //           timer.cancel();
  //         });
  //       } else {
  //         setState(() {
  //           widget.duration--;
  //         });
  //       }
  //     },
  //   );
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        title: Text(
            //widget.course.courseName +
            "${widget.quizTitle}"),
      ),
      body: (!deadLinePassed && !isFinished)
          ? isLoading
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // ignore: deprecated_member_use
                        questionSnapshot == null
                            ? Container(
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                // ignore: deprecated_member_use
                                itemCount: questionSnapshot.documents.length,
                                itemBuilder: (context, index) {
                                  quiz =
                                      dataBaseServices.getQuestionFromSnapshot(
                                          // ignore: deprecated_member_use
                                          questionSnapshot.documents[index]);
                                  return QuestionTile(
                                      dataBaseServices.getQuestionFromSnapshot(
                                          // ignore: deprecated_member_use
                                          questionSnapshot.documents[index]),
                                      index);
                                }),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: isSubmitted == false
                              ? () {
                                  setState(() {
                                    isSubmitted = true;
                                  });
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) {
                                      return Result(
                                          course: widget.course,
                                          total:
                                              // ignore: deprecated_member_use
                                              questionSnapshot.documents.length,
                                          correct: correctAnswers);
                                    }),
                                  );
                                }
                              : null,
                          child: CustomeButton(
                            context: context,
                            title: "Submit the Quiz",
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
          : deadLinePassed
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    "the Quiz is finished",
                    style: TextStyle(fontSize: 30, color: Colors.black87),
                  ),
                )
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return Result(
                        course: widget.course,
                        total:
                            // ignore: deprecated_member_use
                            questionSnapshot.documents.length,
                        correct: correctAnswers);
                  }),
                ),
    );
  }
}
