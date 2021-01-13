import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utils.dart';

class TeacherCV extends StatefulWidget {
  @override
  _TeacherCVState createState() => _TeacherCVState();
}

class _TeacherCVState extends State<TeacherCV> {
  Query _ref;
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('CVs')
        .orderByChild('CVs');
  }

  Widget _buildTrainingItem({Map trainings}) {
    _launchurl() async {
      var url = trainings["link"];
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw "can't launch";
      }
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      height: 90,
      //maxHeight: double.infinity,
      color: Colors.purple[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.cast_for_education_rounded),
              color: Colors.blue,
              iconSize: 30,
              onPressed: () => _launchurl(),
              ),
            SizedBox(
              width: 6,
            ),
            Text(
              trainings['name'],
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600),
            ),
          ]),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        centerTitle: true,
        title: Text('CVs'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map trainings = snapshot.value;
            return _buildTrainingItem(trainings: trainings);
          },
        ),
      ),
    );
  }
}
