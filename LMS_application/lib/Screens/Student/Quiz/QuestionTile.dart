import 'package:LMS_application/Screens/Student/Quiz/OptionTile.dart';
import 'package:LMS_application/Screens/Teacher/Discussion/utils.dart';
import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/models/QuizQuestion.dart';
import 'package:flutter/material.dart';

class QuestionTile extends StatefulWidget {
  final QuizQuestion quizQuestion;
  final int index;

  QuestionTile(this.quizQuestion, this.index);

  @override
  _QuestionTileState createState() => _QuestionTileState();
}

int _correct = 0;
int _wrong = 0;

class _QuestionTileState extends State<QuestionTile> {
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
          GestureDetector(
            onTap: () {
              if (widget.quizQuestion.option1 ==
                  widget.quizQuestion.correctOption) {
                setState(() {
                  optionSelected = widget.quizQuestion.option1;
                  _correct += 1;
                });
              } else {
                setState(() {
                  optionSelected = widget.quizQuestion.option1;
                  _wrong += 1;
                });
              }
            },
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
            onTap: () {
              if (widget.quizQuestion.option2 ==
                  widget.quizQuestion.correctOption) {
                setState(() {
                  optionSelected = widget.quizQuestion.option2;
                  _correct += 1;
                });
              } else {
                setState(() {
                  optionSelected = widget.quizQuestion.option2;
                  _wrong += 1;
                });
              }
            },
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
            onTap: () {
              if (widget.quizQuestion.option3 ==
                  widget.quizQuestion.correctOption) {
                setState(() {
                  optionSelected = widget.quizQuestion.option3;
                  _correct += 1;
                });
              } else {
                setState(() {
                  optionSelected = widget.quizQuestion.option3;
                  _wrong += 1;
                });
              }
            },
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
            onTap: () {
              if (widget.quizQuestion.option4 ==
                  widget.quizQuestion.correctOption) {
                setState(() {
                  optionSelected = widget.quizQuestion.option4;
                  _correct += 1;
                });
              } else {
                setState(() {
                  optionSelected = widget.quizQuestion.option4;
                  _wrong += 1;
                });
              }
            },
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
        ],
      ),
    );
  }
}
