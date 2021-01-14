//import 'Materials_doc.dart';
import 'package:LMS_application/models/material.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TeacherMaterial extends StatelessWidget {
  TeacherMaterial({@required this.courseCode, @required this.materialData});

  final Materiala materialData;
  final String courseCode;

  @override
  Widget build(BuildContext context) {
    _launchurl() async {
      var url = materialData.link;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "can't launch";
      }
    }

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
            IconButton(
              icon: Icon(Icons.open_in_browser_rounded),
              color: Colors.purple,
              iconSize: 30,
              onPressed: _launchurl,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              materialData.title,
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
                Icons.create,
                color: Colors.purple,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              SizedBox(width: 15),
            ],
          ),
        ],
      ),
    );
    /*
    return Card(
      elevation: 30,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      color: Theme.of(context).primaryColor,
      child: Row(children: [
        Icon(
          Icons.link,
          size: 60,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              materialData.title,
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
              materialData.link,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 4,
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