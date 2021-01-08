import 'package:LMS_application/models/quiz.dart';
import 'package:flutter/material.dart';

class QuizList extends StatelessWidget {
  final List<Quiz> myQuizes;
  QuizList(this.myQuizes);

  void openQuiz(Quiz q, context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return;
      //OpenCourse(q);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text('Quiz ${index + 1}'),
              //onPressed: () {} //=> openQuiz(myQuizes[index], context),
              onPressed: () {
                /////////////////////////////////////////////////////////////////////////////////
                {
                  Future.delayed(
                      Duration(
                          hours: 1, //myQuizes[index].hours,
                          minutes: 1, //myQuizes[index].minutes,
                          seconds: 1), //myQuizes[index].secounds),
                      () {
                    print('Nice');
                  });
                }
              },
            ),
          );
        },
        itemCount: myQuizes.length,
      ),
    );
  }
}
