import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:url_launcher/url_launcher.dart';
import 'utils.dart';

class StudentTraining extends StatefulWidget {
  @override
  _StudentTrainingState createState() => _StudentTrainingState();
}

class _StudentTrainingState extends State<StudentTraining> {
  Query _ref;
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Trainings')
        .orderByChild('Trainings');
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
      height: 140,
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
              onPressed: () => Utils.openEmail(
                  toEmail: trainings["link"],
                  subject: 'Apply for Intern',
                  body: 'My CV must be here'),
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
              Flexible(
              child: Center(
              child:Text(
                trainings['description'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600),
                    softWrap: true,
                    maxLines: 6,
                    //overflow: TextOverflow.ellipsis,
              ),
              ),
              ),
              SizedBox(width: 15),
            ],
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
        title: Text('Trainings'),
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
