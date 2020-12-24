import 'package:flutter/material.dart';
import '../classes/course.dart';
import './teacher_open_course.dart';

class TeacherCoursesList extends StatelessWidget {
  List<Course> myCourses;
  final Function deleteCourse;
  TeacherCoursesList({this.myCourses, this.deleteCourse});

  void openCourse(Course cr, context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return TeacherOpenCourse(cr);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
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
                        myCourses[index].courseCode,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                title: Text(
                  myCourses[index].courseName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myCourses[index].courseDescription,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Credit hours: ' +
                              myCourses[index].courseCreditHours +
                              'h',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                //If we wanted to add delete button
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: //() => openCourse(myCourses[index], context),
                      () => deleteCourse(
                          myCourses[index].courseCode), // or open course
                ),
              ),
            ),
            onPressed: () => openCourse(myCourses[index], context),
          );
        },
        itemCount: myCourses.length,
      ),
    );
  }
}
