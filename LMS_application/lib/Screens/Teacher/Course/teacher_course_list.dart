import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'teacher_open_course.dart';

class TeacherCoursesList extends StatelessWidget {
  final Teacher teacher;
  //final Function deleteCourse;
  TeacherCoursesList(this.teacher);

  void openCourse(Course course, context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return TeacherOpenCourse(course);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return StreamBuilder<Object>(
              stream: Database(teacher.courses[index]).courseData,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                Course myCourses = snapshot.data;
                return FlatButton(
                  child: Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    elevation: 15,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: FittedBox(
                            child: Text(
                              myCourses.courseCode,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        myCourses.courseName,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            myCourses.courseDescription,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Credit hours: ' +
                                    myCourses.courseCreditHours +
                                    'h',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  onPressed: () => openCourse(myCourses, context),
<<<<<<< HEAD
=======
                  key: ValueKey('courseButton'),
>>>>>>> sharnoby
                );
              });
        },
        itemCount: teacher.courses.length,
      ),
    );
  }
}
