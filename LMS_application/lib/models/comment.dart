import 'package:flutter/material.dart';
import './teacher.dart';

class CommentModel {
  final Teacher user;
  final String comment;
  final DateTime time;

  const CommentModel({
    @required this.user,
    @required this.comment,
    @required this.time,
  });
}
