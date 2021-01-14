import 'dart:async';

import 'package:LMS_application/Screens/Student/Quiz/QuestionTile.dart';
import 'package:LMS_application/Screens/Student/Quiz/Result.dart';
import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/models/QuizQuestion.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'OptionTile.dart';

class PlayQuizStudent extends StatefulWidget {
  final String quizId;
  final String quizTitle;
  final Course course;
  final DateTime quizDeadLine;
  final int duration;
  DateTime startTime;
  final Student student;
  PlayQuizStudent({
    this.quizId,
    this.quizTitle,
    this.course,
    this.quizDeadLine,
    this.duration,
    this.startTime,
    this.student,
  });

  @override
  _PlayQuizStudentState createState() => _PlayQuizStudentState();
}

int _correct = 0;

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
      setState(() {
        isLoading = false;
      });
    });
  }

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
                                  print("${_correct}");
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
                                          correct: _correct,
                                          student: widget.student);
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
                      correct: _correct,
                      student: widget.student,
                    );
                  }),
                ),
    );
  }
}

// ignore: must_be_immutable
class QuestionTile extends StatefulWidget {
  final QuizQuestion quizQuestion;
  final int index;

  QuestionTile(this.quizQuestion, this.index);

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  String optionSelected = "";
  bool flag = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            " Q${widget.index + 1} ${widget.quizQuestion.question}",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
          SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: widget.quizQuestion.answered == false
                ? () {
                    if (widget.quizQuestion.option1 ==
                        widget.quizQuestion.correctOption) {
                      setState(() {
                        optionSelected = widget.quizQuestion.option1;
                        flag = true;
                      });
                    } else {
                      setState(() {
                        optionSelected = widget.quizQuestion.option1;
                        flag = false;
                      });
                    }
                  }
                : null,
            child: OptionTile(
              optionDes: widget.quizQuestion.option1,
              optionSymbol: 'A',
              optionSelected: optionSelected,
              correctAnswer: widget.quizQuestion.correctOption,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: widget.quizQuestion.answered == false
                ? () {
                    if (widget.quizQuestion.option2 ==
                        widget.quizQuestion.correctOption) {
                      setState(() {
                        optionSelected = widget.quizQuestion.option2;
                        flag = true;
                      });
                    } else {
                      setState(() {
                        optionSelected = widget.quizQuestion.option2;
                        flag = false;
                      });
                    }
                  }
                : null,
            child: OptionTile(
              optionDes: widget.quizQuestion.option2,
              optionSymbol: 'B',
              optionSelected: optionSelected,
              correctAnswer: widget.quizQuestion.correctOption,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: widget.quizQuestion.answered == false
                ? () {
                    if (widget.quizQuestion.option3 ==
                        widget.quizQuestion.correctOption) {
                      setState(() {
                        optionSelected = widget.quizQuestion.option3;
                        flag = true;
                      });
                    } else {
                      setState(() {
                        optionSelected = widget.quizQuestion.option3;
                        flag = false;
                      });
                    }
                  }
                : null,
            child: OptionTile(
              optionDes: widget.quizQuestion.option3,
              optionSymbol: 'C',
              optionSelected: optionSelected,
              correctAnswer: widget.quizQuestion.correctOption,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: widget.quizQuestion.answered == false
                ? () {
                    if (widget.quizQuestion.option4 ==
                        widget.quizQuestion.correctOption) {
                      setState(() {
                        optionSelected = widget.quizQuestion.option4;
                        flag = true;
                      });
                    } else {
                      setState(() {
                        optionSelected = widget.quizQuestion.option4;
                        flag = false;
                      });
                    }
                  }
                : null,
            child: OptionTile(
              optionDes: widget.quizQuestion.option4,
              optionSymbol: 'D',
              optionSelected: optionSelected,
              correctAnswer: widget.quizQuestion.correctOption,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          FloatingActionButton(
            heroTag: null,
            child: Icon(Icons.check),
            onPressed: widget.quizQuestion.answered
                ? null
                : () {
                    if (widget.quizQuestion.answered == false)
                      setState(() {
                        widget.quizQuestion.answered = true;
                        if (flag) _correct = _correct + 1;
                      });
                    print("${widget.quizQuestion.answered}");
                  },
            backgroundColor: widget.quizQuestion.answered == false
                ? Colors.purple
                : Colors.grey,
          ),
        ],
      ),
    );
  }
}
