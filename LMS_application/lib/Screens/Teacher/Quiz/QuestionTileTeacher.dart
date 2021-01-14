import 'package:LMS_application/Screens/Student/Quiz/OptionTile.dart';
import 'package:LMS_application/models/QuizQuestion.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionTileTeacher extends StatefulWidget {
  final QuizQuestion quizQuestion;
  final int index;
  //bool isCorrect;

  QuestionTileTeacher(this.quizQuestion, this.index);

  @override
  _QuestionTileTeacherState createState() => _QuestionTileTeacherState();
}

int _correct = 0;
int _wrong = 0;

class _QuestionTileTeacherState extends State<QuestionTileTeacher> {
  String optionSelected = "";

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
          OptionTile(
            optionDes: widget.quizQuestion.option1,
            optionSymbol: 'A',
            optionSelected: optionSelected,
            correctAnswer: widget.quizQuestion.correctOption,
            //isAnswered: widget.quizQuestion.answered,
          ),
          SizedBox(
            height: 8,
          ),
          OptionTile(
            optionDes: widget.quizQuestion.option2,
            optionSymbol: 'B',
            optionSelected: optionSelected,
            correctAnswer: widget.quizQuestion.correctOption,
            //isAnswered: widget.quizQuestion.answered,
          ),
          SizedBox(
            height: 8,
          ),
          OptionTile(
            optionDes: widget.quizQuestion.option3,
            optionSymbol: 'C',
            optionSelected: optionSelected,
            correctAnswer: widget.quizQuestion.correctOption,
            //isAnswered: widget.quizQuestion.answered,
          ),
          SizedBox(
            height: 8,
          ),
          OptionTile(
            optionDes: widget.quizQuestion.option4,
            optionSymbol: 'D',
            optionSelected: optionSelected,
            correctAnswer: widget.quizQuestion.correctOption,
            //isAnswered: widget.quizQuestion.answered,
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
