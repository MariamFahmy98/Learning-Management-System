import 'package:LMS_application/Screens/Teacher/Quiz/CreateQuiz.dart';
import 'package:LMS_application/Widgets/QuizTIle.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/database.dart';
import 'package:flutter/material.dart';

class StudentQuiz extends StatefulWidget {
  final Course course;
  final Student student;
  StudentQuiz(this.course, this.student);

  @override
  _StudentQuizState createState() => _StudentQuizState();
}

class _StudentQuizState extends State<StudentQuiz> {
  @override
  Stream quizStream;
  DataBaseServices dataBaseServices = new DataBaseServices();

  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Center(
                  child: Container(
                    child: Text(
                      "there's no quizes yet",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (contex, index) {
                    return QuizTile(
                      title: snapshot.data.docs[index].data()["quizTitle"],
                      description: snapshot.data.docs[index].data()["quizDes"],
                      quizId: snapshot.data.docs[index].data()["quizId"],
                      quizDeadLine:
                          snapshot.data.docs[index].data()["deadline"].toDate(),
                      isTeacher: false,
                      course: widget.course,
                      duration:
                          snapshot.data.docs[index].data()["quizDuration"],
                      student: widget.student,
                    );
                  });
        },
      ),
    );
  }

  @override
  void initState() {
    dataBaseServices.getQuizesData(widget.course.courseCode).then((val) {
      setState(() {
        quizStream = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.light,
        title: Text(
            //widget.course.courseName +
            "Quizes"),
      ),
      body: quizList(),
    );
  }
}
