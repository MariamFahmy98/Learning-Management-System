import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/services/database.dart';
import 'package:flutter/material.dart';

class AddQuestion extends StatefulWidget {
  final String qizId;
  AddQuestion(this.qizId);

  @override
  _AddQuestionState createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  final _formKey = GlobalKey<FormState>();

  String question, option1, option2, option3, option4;
  bool _isLoading = false;

  DataBaseServices dataBaseService = new DataBaseServices();

  uploadQuistionData() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      Map<String, String> questionMap = {
        "question": question,
        "option1": option1,
        "option2": option2,
        "option3": option3,
        "option4": option4,
      };

      await dataBaseService
          .addQuestionData(questionMap, widget.qizId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        title: Text("Quizzes"),
      ),
      body: _isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ListView(
                  children: [
                    TextFormField(
                      validator: (val) => val.isEmpty ? "enter Question" : null,
                      decoration: InputDecoration(
                        hintText: "Question",
                      ),
                      onChanged: (val) {
                        question = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? "enter Option1" : null,
                      decoration: InputDecoration(
                        hintText: "Option1 (correct answer)",
                      ),
                      onChanged: (val) {
                        option1 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? "enter Option2" : null,
                      decoration: InputDecoration(
                        hintText: "Option2",
                      ),
                      onChanged: (val) {
                        option2 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? "enter Option3" : null,
                      decoration: InputDecoration(
                        hintText: "Option3",
                      ),
                      onChanged: (val) {
                        option3 = val;
                      },
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      validator: (val) => val.isEmpty ? "enter Option4" : null,
                      decoration: InputDecoration(
                        hintText: "Option4",
                      ),
                      onChanged: (val) {
                        option4 = val;
                      },
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            uploadQuistionData();
                          },
                          child: CustomeButton(
                            title: "Add Question",
                            context: context,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CustomeButton(
                            title: "Submit",
                            context: context,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
