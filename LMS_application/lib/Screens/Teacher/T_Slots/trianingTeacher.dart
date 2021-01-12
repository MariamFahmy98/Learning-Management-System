import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'addTraining.dart';
import 'package:url_launcher/url_launcher.dart';
class TeacherTraining extends StatefulWidget {
  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<TeacherTraining> {
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
      height: 160,
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
              onPressed: _launchurl,
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
            Map mats = snapshot.value;
            return _buildTrainingItem(trainings: mats);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AddTrainings();
          }));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}