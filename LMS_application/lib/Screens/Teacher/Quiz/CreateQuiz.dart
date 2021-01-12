import 'package:LMS_application/services/database.dart';

import 'AddQuestion.dart';
import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuize extends StatefulWidget {
  final String courseId;
  CreateQuize(this.courseId);
  @override
  _CreateQuizeState createState() => _CreateQuizeState();
}

class _CreateQuizeState extends State<CreateQuize> {
  final _formKey = GlobalKey<FormState>();
  String quizTitle, quizDescription, quizId, quizDuration;

  DataBaseServices dataBaseService = new DataBaseServices();

  bool _isLoading = false;

  createQuizOnline() async {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState.validate()) {
      quizId = randomAlphaNumeric(16);

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizTitle": quizTitle,
        "quizDes": quizDescription,
        "quizDuration": quizDuration,
      };
      await dataBaseService
          .addQuizData(quizMap, quizId, widget.courseId)
          .then((value) {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AddQuestion(quizId),
              ));
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("New quiz"),
      ),
      body: _isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "enter quize title" : null,
                      decoration: InputDecoration(
                        hintText: "Quize title",
                      ),
                      onChanged: (val) {
                        quizTitle = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "enter quize description" : null,
                      decoration: InputDecoration(
                        hintText: "Quize description",
                      ),
                      onChanged: (val) {
                        quizDescription = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) =>
                          val.isEmpty ? "enter quize duration" : null,
                      decoration: InputDecoration(
                        hintText: "Quize duration in min.",
                      ),
                      onChanged: (val) {
                        quizDuration = val;
                      },
                    ),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          createQuizOnline();
                        },
                        child: CustomeButton(
                          title: "Create Quiz",
                          context: context,
                        )),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
