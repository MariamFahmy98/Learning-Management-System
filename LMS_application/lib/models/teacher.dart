import 'package:flutter/material.dart';
//import 'post.dart';

class Teacher {
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
