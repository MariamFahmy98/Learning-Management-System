import 'package:flutter/material.dart';

import 'package:LMS_application/services/DataBase2.dart';
import 'package:LMS_application/models/course.dart';

import 'addofficehour.dart';
import 'officehours_list.dart';

class TeacherOfficehoursList extends StatelessWidget {
  final Course course;

  TeacherOfficehoursList(this.course);

  void _startAddNewOfficehour(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => NewOfficehour(course.courseCode),
      //isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Officehours'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: Database(course.courseCode).officehoursData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            var officehours = snapshot.data;
            return (officehours.length == 0)
                ? Text(
                    'No office hours Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => TeacherOfficehour(
                      courseCode: course.courseCode,
                      officehourData: officehours[index],
                    ),
                    itemCount: officehours.length,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewOfficehour(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
