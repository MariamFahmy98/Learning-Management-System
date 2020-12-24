import 'package:LMS_application/Screens/Student/StudentHomeScreen.dart';
import 'package:LMS_application/Screens/Teacher/TeacherHomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Widgets/auth/auth_form.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen();
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  String userID;
  bool _isTeacher;

  Future<bool> _isSpecificUser(String userID, String users) async {
    var snapshot = await Firestore.instance.collection(users).getDocuments();
    var teachers = snapshot.documents;

    for (int i = 0; i < teachers.length; i++)
      if (teachers[i].documentID == userID) return true;

    return false;
  }

  void _submitAuthForm(
    String email,
    String password,
    BuildContext ctx,
  ) async {
    AuthResult authResult;

    try {
      setState(() {
        _isLoading = true;
      });

      authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      userID = authResult.user.uid;
      _isTeacher = await _isSpecificUser(userID, 'Teachers');

      setState(() {
        _isLoading = false;
      });

    } on PlatformException catch (error) {
      var message = "An error occurred, please check your credentials";
      if (error.message != null) message = error.message;
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData && _isTeacher != null) {
          if (_isTeacher)
            return TeacherHomeScreen(userID);
          else
            return StudentHomeScreen(userID);
        } else
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: AuthForm(
              _submitAuthForm,
              _isLoading,
            ),
          );
      },
    );
  }
}
