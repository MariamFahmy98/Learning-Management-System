import 'package:LMS_application/models/User.dart';
import 'package:flutter/material.dart';

class Student extends User {
  String name;
  String id;
  bool cv;
  List<String> courses;

  Student({@required this.id, @required this.name, @required this.courses});
}
