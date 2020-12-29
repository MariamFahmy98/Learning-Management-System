import 'package:LMS_application/models/User.dart';
import 'package:flutter/material.dart';

class Teacher extends User {
  String name;
  String id;
  List<String> courses;

  Teacher({
    @required this.id,
    @required this.name,
    @required this.courses,
  });
}
