import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';

import './student_open_course.dart';

class StudentCoursesList extends StatelessWidget {
  //final List<Course> myCourses;
  final Student student;
  StudentCoursesList(this.student);

  void openCourse(Course cr, context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return OpenCourse(student, cr);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return StreamBuilder<Object>(
              stream: Database(student.courses[index]).courseData,
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
                );
              });
        },
        itemCount: student.courses.length,
      ),
    );
  }
}
