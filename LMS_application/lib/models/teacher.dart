import 'package:flutter/material.dart';

class Teacher {
  String name;
  String id;
  List<String> courses;

  Teacher({
    @required this.id,
    @required this.name,
    @required this.courses,
  });
}
