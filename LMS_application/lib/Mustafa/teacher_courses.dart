import 'package:flutter/material.dart';
import '../classes/course.dart';
import '../classes/teacher.dart';
import './teacher_course_list.dart';
import './teacher_add_course.dart';

class TeacherCourses extends StatefulWidget {
  Teacher teacher;
  List<Course> allCoursesAll;
  TeacherCourses({this.teacher, this.allCoursesAll});
  @override
  _TeacherCourses createState() => _TeacherCourses(teacher, allCoursesAll);
}

class _TeacherCourses extends State<TeacherCourses> {
  List<Course> allCourses;
  Teacher teacher;
  _TeacherCourses(this.teacher, this.allCourses);

  void addNewCourse(String crName, String crCode, String crDescription,
      String crCreditHours) {
    final newCr = Course(
      courseCreditHours: crCreditHours,
      courseDescription: crDescription,
      courseCode: crCode,
      courseName: crName,
    );
    allCourses.add(newCr);
    setState(() {
      teacher.myCourses.add(newCr);
    });
  }

  void _deleteCourse(String code) {
    setState(() {
      teacher.myCourses.removeWhere((course) {
        return course.courseCode == code;
      });
    });
  }

  void _startAddNewCourse(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: TeacherAddCourse(addNewCourse),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Courses'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TeacherCoursesList(
              myCourses: teacher.myCourses,
              deleteCourse: _deleteCourse,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _startAddNewCourse(context);
        },
      ),
    );
  }
}
