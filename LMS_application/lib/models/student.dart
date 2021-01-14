import 'package:LMS_application/models/User.dart';
import 'package:flutter/material.dart';

class Student extends User {
  String name;
  String id;
  List<String> courses;
  Map<String, int> result = {
    "KmnhpEwzec8Mo11c": 0,
  };

  Student({@required this.id, @required this.name, @required this.courses});
}
