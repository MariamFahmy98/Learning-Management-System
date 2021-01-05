import 'package:LMS_application/Screens/Teacher/Quiz/CreateQuiz.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/services/database.dart';

import 'package:flutter/material.dart';

class TeacherQuize extends StatefulWidget {
  final Course course;
  TeacherQuize(this.course);

  @override
  _TeacherQuizeState createState() => _TeacherQuizeState();
}

class _TeacherQuizeState extends State<TeacherQuize> {
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
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (contex, index) {
                    return QuizTile(
                      title: snapshot.data.documents[index].data["quizTitle"],
                      description:
                          snapshot.data.documents[index].data["quizDes"],
                    );
                  });
        },
      ),
    );
  }

  @override
  void initState() {
    dataBaseServices.getQuizData(widget.course.courseCode).then((val) {
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
        title: Text("كويزات مجنونة"),
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

/*import 'package:LMS_application/Screens/CreateQuiz.dart';
import 'package:LMS_application/services/DataBase.dart';
import 'package:flutter/material.dart';

class Quize extends StatefulWidget {
  @override
  _QuizeState createState() => _QuizeState();
}

class _QuizeState extends State<Quize> {
  Stream quizStream;
  DataBaseServices dataBaseServices = new DataBaseServices();

  Widget quizList() {
    return Container(
      child: StreamBuilder(
        stream: quizStream,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? Container()
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (contex, index) {
                    return QuizTile(
                      title: snapshot.data.documents[index].data["quizTitle"],
                      description:
                          snapshot.data.documents[index].data["quizDes"],
                    );
                  });
        },
      ),
    );
  }

  @override
  void initState() {
    dataBaseServices.getQuizData().then((val) {
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Text("كويزات مجنونة"),
      ),
      body: Center(
        child: Container(
          child: Text(
            "منورين الكويزات يا رغالة",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
           builder: (context) => CreateQuize(widget.course.courseCode)),
          );
        },
      ),
    );
  }
}
*/
class QuizTile extends StatelessWidget {
  String title;
  String description;

  QuizTile({this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      height: 150,
      child: Stack(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            "https://images.app.goo.gl/TtCqsabKoSuSmKv48",
            width: MediaQuery.of(context).size.width - 48,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
