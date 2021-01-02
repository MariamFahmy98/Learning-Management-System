import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/quiz.dart';
import 'package:flutter/material.dart';
import 'teacher_requests_list.dart';

class TeacherOpenCourse extends StatefulWidget {
  final Course runningCourse;
  TeacherOpenCourse(this.runningCourse);

  @override
  _TeacherOpenCourse createState() => _TeacherOpenCourse(runningCourse);
}

class _TeacherOpenCourse extends State<TeacherOpenCourse> {
  Course cr;
  _TeacherOpenCourse(this.cr);
  final List<Quiz> myQuizes = [
    Quiz(hours: 0, minutes: 0, secounds: 5),
  ];
/*
  void _addQuiz(String qQuestion, int qHours, int qMinutes, int qSecounds) {
    final newQuiz = Quiz(
      question: qQuestion,
      hours: qHours,
      minutes: qMinutes,
      secounds: qSecounds,
    );
    setState(() {
      myQuizes.add(newQuiz);
    });
  }

  void _startAddNewQuiz(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewQuiz(_addQuiz),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.runningCourse.courseName),
        actions: [
          IconButton(
              icon: Icon(Icons.request_page),
              onPressed: () {
                Navigator.of(context)
                    .push(new MaterialPageRoute(builder: (context) {
                  return RequestsPage();
                }));
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(5),
            child: Text(
              widget.runningCourse.courseName +
                  ' (' +
                  widget.runningCourse.courseCode +
                  ')',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(5),
            child: Text(
              'Course description: -\n' +
                  widget.runningCourse.courseDescription +
                  '\n \nCredit hours:- ' +
                  widget.runningCourse.courseCreditHours +
                  'h',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 5,
                child: Text(
                  'Course materials: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //will be list of material
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: FlatButton(
                  child: Text('example'),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
              ),
              Card(
                elevation: 5,
                child: Text(
                  'Quizes: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //will be list of Quizes
              Container(
                height: 100,
                child: Text('Add Quiz'), //QuizList(myQuizes: myQuizes),
              ),
              Card(
                elevation: 5,
                child: Text(
                  'Assingments: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              //Also will be a list
              Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                child: FlatButton(
                  child: Text('Assignment 1'),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print(cr.courseName);
          } // => _startAddNewQuiz(context),
          ),
    );
  }
}
