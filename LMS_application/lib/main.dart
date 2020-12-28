import 'package:LMS_application/Screens/Teacher/Announcement/TeacherAnnouncements.dart';
import 'package:LMS_application/Screens/auth-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LMS Application',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        backgroundColor: Colors.purple,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.purple,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      home: AuthScreen(),
    );
  }
}
