import 'package:flutter/material.dart';
import '../classes/course.dart';
import 'student_open_course.dart';

class MyCoursesList extends StatelessWidget {
  List<Course> myCourses;
  MyCoursesList({this.myCourses});

  void openCourse(Course cr, context) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return OpenCourse(cr);
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
