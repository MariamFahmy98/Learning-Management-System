import 'package:flutter/material.dart';
import 'package:LMS_application/models/course.dart';

import '../../../services/DataBase2.dart';
import 'Add_materials.dart';
import 'Materials_list.dart';

class TeacherMaterialsList extends StatelessWidget {
  final Course course;

  TeacherMaterialsList(this.course);

  void _startAddNewMaterial(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (_) => NewMaterial(course.courseCode),
      //  isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${course.courseCode} - Materials'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: Database(course.courseCode).materialsData,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();
            var materials = snapshot.data;
            return (materials.length == 0)
                ? Text(
                    'No Materials Yet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (ctx, index) => TeacherMaterial(
                      courseCode: course.courseCode,
                      materialData: materials[index],
                    ),
                    itemCount: materials.length,
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewMaterial(context), ///////////////
        child: Icon(Icons.add),
      ),
    );
  }
}
