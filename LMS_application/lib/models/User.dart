import 'package:flutter/material.dart';

class User {
  String name;
  String id;
  List<String> courses;

  User({
    @required this.id,
    @required this.name,
    @required this.courses,
  });
}
