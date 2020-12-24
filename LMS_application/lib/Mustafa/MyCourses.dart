import 'package:flutter/material.dart';
import '../classes/student.dart';
import '../classes/teacher.dart';
import '../classes/course.dart';
import '../classes/quiz.dart';
import './students_avalabile_courses.dart';
import './student_courses.dart';
import './teacher_courses.dart';

class MyCourses extends StatelessWidget {
  final Teacher userTeacher = new Teacher(myCourses: [
    Course(
      courseName: 'Data Communication',
      courseCode: 'SCE321',
      courseCreditHours: '12',
      courseDescription: 'YYYYYYYYYYYYYYYYYYYYYYYYYYY',
      quizes: [
        Quiz(hours: 0, minutes: 0, secounds: 5, question: 'You won a question!')
      ],
    )
  ]);

  final Student user = new Student([
    Course(
      courseName: 'Software Engineering',
      courseCode: 'SCE325',
      courseCreditHours: '20',
      courseDescription: 'XXXXXXXXXXXXXXXXX',
      quizes: [
        Quiz(hours: 0, minutes: 0, secounds: 5, question: 'You won a question!')
      ],
    )
  ], 170139, 'Mustafa');

  final List<Course> allCourses = [
    Course(
      courseName: 'Data Communication',
      courseCode: 'SCE321',
      courseCreditHours: '12',
      courseDescription: 'YYYYYYYYYYYYYYYYYYYYYYYYYYY',
      quizes: [
        Quiz(hours: 0, minutes: 0, secounds: 5, question: 'You won a question!')
      ],
    ),
    Course(
      courseName: 'Software Engineering',
      courseCode: 'CSE211',
      courseDescription:
          'Software engineering is a branch of computer science which includes a lot Software engineer is a branch of computer science which includes a lot.',
      courseCreditHours: '20',
    ),
    Course(
      courseName: 'Computer Orginzation',
      courseCode: 'CSE311',
      courseDescription:
          'Software engineering is a branch of computer science which includes a lot Software engineer is a branch of computer science which includes a lot.',
      courseCreditHours: '20',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Courses'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Teacher Courses',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return TeacherCourses(
                  teacher: userTeacher,
                  allCoursesAll: allCourses,
                );
              }));
            },
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Student Avalibale Courses',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return StudentAvalabileCourse(
                  user: user,
                  allCourses: allCourses,
                );
              }));
            },
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Student My Courses',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (context) {
                return StudentCourses(user.courses);
              }));
            },
          ),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class MyCourses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("كورسات مجنونة"),
      ),
      body: Center(
        child: Container(
            child: Text(
          "منورين الكورسات يا رغالة",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
  }
}
*/
