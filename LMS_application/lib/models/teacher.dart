import 'package:LMS_application/models/User.dart';
import 'package:flutter/material.dart';
//import 'post.dart';

class Teacher extends User {
  String name;
  String id;
  List<String> courses;
  // List<PostModel> posts;

  Teacher({
    @required this.id,
    @required this.name,
    @required this.courses,
    // @required this.posts,
  });
}
