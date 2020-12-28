import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './teacher.dart';
import './comment.dart';

class PostModel {
  final String id, title, body;
  final DateTime postTime;
  final int reacts;
  final Teacher author;
  final List<CommentModel> comments;

  const PostModel({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.author,
    @required this.postTime,
    @required this.reacts,
    @required this.comments,
  });

  String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}
