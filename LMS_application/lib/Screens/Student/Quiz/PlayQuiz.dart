import 'package:LMS_application/Screens/Student/Quiz/QuestionTile.dart';
import 'package:LMS_application/Screens/Student/Quiz/Result.dart';
import 'package:LMS_application/Widgets/CustomeButton.dart';
import 'package:LMS_application/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PlayQuiz extends StatefulWidget {
  final String quizId;
  PlayQuiz(this.quizId);
  @override
  _PlayQuizState createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  bool isLoading = true;
  DataBaseServices dataBaseServices = new DataBaseServices();
  QuerySnapshot questionSnapshot;
  @override
  void initState() {
    print("${widget.quizId}");
    dataBaseServices.getQuizQuestionData(widget.quizId).then((value) {
      questionSnapshot = value;
      isLoading = false;
    });
    setState(() {});
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
            "Empty now"),
      ),
      body: isLoading
          ? Container(
              child: Center(
              child: CircularProgressIndicator(),
            ))
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ignore: deprecated_member_use
                    questionSnapshot == null
                        ? Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            // ignore: deprecated_member_use
                            itemCount: questionSnapshot.documents.length,
                            itemBuilder: (context, index) {
                              return QuestionTile(
                                  dataBaseServices.getQuestionFromSnapshot(
                                      // ignore: deprecated_member_use
                                      questionSnapshot.documents[index]),
                                  index);
                            }),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Result();
                        }));
                      },
                      child: CustomeButton(
                        context: context,
                        title: "Submit the Quiz",
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
