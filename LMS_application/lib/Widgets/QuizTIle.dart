import 'package:LMS_application/Screens/Student/Quiz/PlayQuiz.dart';
import 'package:flutter/material.dart';

class QuizTile extends StatelessWidget {
  final String title;
  final String description;
  final String quizId;

  QuizTile({this.title, this.description, this.quizId});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PlayQuiz(quizId)));
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
        height: 100,
        decoration: BoxDecoration(
            color: Colors.purple,
            border: Border.all(
              color: Colors.purple,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
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
    );
  }
}
