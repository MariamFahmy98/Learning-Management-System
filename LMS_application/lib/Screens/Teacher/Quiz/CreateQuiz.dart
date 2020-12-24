import './AddQuestion.dart';
import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/services/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class CreateQuize extends StatefulWidget {
  @override
  _CreateQuizeState createState() => _CreateQuizeState();
}

class _CreateQuizeState extends State<CreateQuize> {
  final _formKey = GlobalKey<FormState>();
  String quizTitle, quizDescription, quizId;

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
      };
      await dataBaseService.addQuizData(quizMap, quizId).then((value) {
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
        title: Text("كورسات مجنونة"),
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

/*
Widget AddButton(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 18),
    decoration: BoxDecoration(
      color: Colors.purple,
      borderRadius: BorderRadius.circular(30),
    ),
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width - 48,
    child: Text(
      "Create Quiz",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}*/
