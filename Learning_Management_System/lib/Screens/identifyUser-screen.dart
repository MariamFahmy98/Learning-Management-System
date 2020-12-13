import 'package:flutter/material.dart';
import '../Widgets/user_auth.dart';

class UserIdentify extends StatelessWidget {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome to the LMS app',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Image.asset('assets/images/LMS.png'),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text("I am Student"),
                onPressed: () {
                  flag = true;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserAuthentication(flag)));
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                child: Text("I am Teacher"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserAuthentication(flag)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
