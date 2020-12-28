import 'package:flutter/material.dart';
import 'package:LMS_application/models/post.dart';

class InheritedPostModel extends InheritedWidget {
  final PostModel postData;
  final Widget child;

  InheritedPostModel({
    Key key,
    @required this.postData,
    this.child,
  }) : super(key: key, child: child);

  static InheritedPostModel of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType() as InheritedPostModel);
  }

  @override
  bool updateShouldNotify(InheritedPostModel oldWidget) {
    return true;
  }
}
