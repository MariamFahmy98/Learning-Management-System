import 'package:flutter/material.dart';
import '../Screens/auth-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthentication extends StatelessWidget {
  final bool flag;
  UserAuthentication(this.flag);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            // enter to the homepage of the application
            if (flag) {
              // return the screen that should appear to the student
              //example:
              // return StudentCourse();
            } else {
              //return the screen that should appear to the teacher
              //example:
              //return TeacherCourse();
            }
          }
          return AuthScreen(flag);
        });
  }
}
