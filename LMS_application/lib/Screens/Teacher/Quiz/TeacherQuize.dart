import 'package:LMS_application/Screens/Teacher/Quiz/CreateQuiz.dart';

import 'package:flutter/material.dart';

class TeacherQuize extends StatelessWidget {
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
            //quiz'll be in course's drawer and 'll fetch its id from there
            MaterialPageRoute(builder: (context) => CreateQuize("CSE311")),
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
            MaterialPageRoute(builder: (context) => CreateQuize()),
          );
        },
      ),
    );
  }
}

class QuizTile extends StatelessWidget {
  String title;
  String description;

  QuizTile({this.title, this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [],
      ),
    );
  }
}
*/
