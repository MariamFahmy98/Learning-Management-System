import 'package:LMS_application/Screens/Teacher/Quiz/CreateQuiz.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/services/database.dart';
import 'package:flutter/material.dart';
import '../../../Widgets/QuizTIle.dart';

class TeacherQuiz extends StatefulWidget {
  final Course course;
  TeacherQuiz(this.course);

  @override
  _TeacherQuizState createState() => _TeacherQuizState();
}

class _TeacherQuizState extends State<TeacherQuiz> {
  @override
  Stream quizStream;
  DataBaseServices dataBaseServices = new DataBaseServices();

  Widget quizList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data == null
              ? Center(
                  child: Container(
                  child: Text(
                    "there's no quizes yet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
              : ListView.builder(
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (contex, index) {
                    return QuizTile(
                      title: snapshot.data.docs[index].data()["quizTitle"],
                      description: snapshot.data.docs[index].data()["quizDes"],
                      quizId: snapshot.data.docs[index].data()["quizId"],
                      course: widget.course,
                      isTeacher: true,
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CreateQuize(widget.course.courseCode)),
          );
        },
      ),
    );
  }
}
