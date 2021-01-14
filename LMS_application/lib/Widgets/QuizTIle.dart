import 'dart:async';

import 'package:LMS_application/Screens/Student/Quiz/PlayQuizStudent.dart';
import 'package:LMS_application/Screens/Teacher/Quiz/PlayQuizTeacher.dart';
import 'package:LMS_application/models/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class QuizTile extends StatefulWidget {
  final String title;
  final String description;
  final String quizId;
  final bool isTeacher;
  final Course course;
  final DateTime quizDeadLine;
  final int duration;
  QuizTile(
      {this.title,
      this.description,
      this.quizId,
      this.isTeacher,
      this.course,
      this.quizDeadLine,
      this.duration});

  @override
  _QuizTileState createState() => _QuizTileState();
}

class _QuizTileState extends State<QuizTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isTeacher
          ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayQuizTeacher(
                    quizId: widget.quizId,
                    quizTitle: widget.title,
                  ),
                ),
              );
            }
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayQuizStudent(
                    quizId: widget.quizId,
                    quizTitle: widget.title,
                    course: widget.course,
                    quizDeadLine: widget.quizDeadLine,
                    startTime: DateTime.now(),
                    duration: widget.duration,
                  ),
                ),
              );
            },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.purple,
            border: Border.all(
              color: Colors.purple,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                )),
            Text(
              widget.description,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
