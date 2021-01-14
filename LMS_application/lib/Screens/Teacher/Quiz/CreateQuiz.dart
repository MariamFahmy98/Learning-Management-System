import 'package:LMS_application/services/database.dart';
import 'package:intl/intl.dart';

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
<<<<<<< HEAD
  String quizTitle, quizDescription, quizId, quizDuration;
=======
  String quizTitle, quizDescription, quizId;
  int quizDuration;
  DateTime _selectedDeadline;
  void _presentDateTimePricker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1))
        .then((pickedDate) {
      if (pickedDate == null) return;

      showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
        (pickedTime) {
          if (pickedDate == null) return;

          setState(() {
            _selectedDeadline = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          });
        },
      );
    });
  }
>>>>>>> sharnoby

  DataBaseServices dataBaseService = new DataBaseServices();

  bool _isLoading = false;

  createQuizOnline() {
    setState(() {
      _isLoading = true;
    });

    if (_formKey.currentState.validate()) {
      quizId = randomAlphaNumeric(16);
<<<<<<< HEAD

      Map<String, String> quizMap = {
        "quizId": quizId,
        "quizTitle": quizTitle,
        "quizDes": quizDescription,
        "quizDuration": quizDuration,
      };
      await dataBaseService
          .addQuizData(quizMap, quizId, widget.courseId)
=======
      dataBaseService
          .addQuizData(quizTitle, quizDescription, quizDuration, quizId,
              widget.courseId, _selectedDeadline)
>>>>>>> sharnoby
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
          : SingleChildScrollView(
              child: Form(
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
<<<<<<< HEAD
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
=======
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "enter quize duration" : null,
                        decoration: InputDecoration(
                          hintText: "Quize duration in min.",
                        ),
                        onChanged: (val) {
                          quizDuration = int.parse(val);
>>>>>>> sharnoby
                        },
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _selectedDeadline == null
                                    ? 'No Chosen Deadline!'
                                    : 'Picked Deadline: \n${DateFormat.MMMEd().format(_selectedDeadline)}   ${DateFormat.jm().format(_selectedDeadline)}',
                              ),
                            ),
                            FlatButton(
                              onPressed: _presentDateTimePricker,
                              child: Text(
                                'Choose Deadline',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              textColor: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                      ),
                      //Spacer(),
                      SizedBox(
                        height: 200,
                      ),
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
            ),
    );
  }
}
