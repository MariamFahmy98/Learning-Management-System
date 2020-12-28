import 'package:flutter/material.dart';
import 'package:LMS_application/models/teacher.dart';

class InheritedUserModel extends InheritedWidget {
  final Teacher userData;
  final Widget child;

  InheritedUserModel({Key key, @required this.userData, this.child})
      : super(key: key, child: child);

  static InheritedUserModel of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType() as InheritedUserModel);
  }

  @override
  bool updateShouldNotify(InheritedUserModel oldWidget) {
    return true;
  }
}
