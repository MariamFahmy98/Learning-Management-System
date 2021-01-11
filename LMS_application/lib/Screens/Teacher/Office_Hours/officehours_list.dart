import 'package:LMS_application/models/officehours.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TeacherOfficehour extends StatelessWidget {
  TeacherOfficehour({@required this.courseCode, @required this.officehourData});

  final Officehour officehourData;
  final String courseCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 100,
      color: Colors.purple[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            SizedBox(
              width: 6,
            ),
            Text(
              officehourData.name,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.purpleAccent,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.lock_clock,
                color: Colors.purple,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    officehourData.place,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "appointment: " +
                        DateFormat.MMMEd().format(officehourData.appointment) +
                        "  " +
                        DateFormat.jm().format(officehourData.appointment),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );

    /*return Card(
      elevation: 30,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: Theme.of(context).primaryColor,
      child: Row(children: [
        Icon(
          Icons.lock_clock,
          size: 60,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              officehourData.place,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "appointment: " +
                  DateFormat.MMMEd().format(officehourData.appointment) +
                  "  " +
                  DateFormat.jm().format(officehourData.appointment),
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ]),
    );*/
  }
}
