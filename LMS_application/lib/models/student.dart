import 'package:flutter/material.dart';


class Student {
  String name;
  String id;
  List<String> courses;

  Student({@required this.id, @required this.name, @required this.courses});
}
