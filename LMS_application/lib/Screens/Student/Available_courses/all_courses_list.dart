import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/models/student.dart';
import 'package:flutter/material.dart';

class AllCoursesList extends StatelessWidget {
  Student user;
  List<Course> myCourses;
  AllCoursesList({this.myCourses, this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
              trailing: IconButton(
                icon: Icon(Icons.add),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  //from database
                  myCourses[index].studentRequest(user);
                },
              ),
            ),
          );
        },
        itemCount: myCourses.length,
      ),
    );
  }
}
