import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'addMaterial.dart';
import 'package:url_launcher/url_launcher.dart';

class Mat extends StatefulWidget {
  @override
  _MatState createState() => _MatState();
}

class _MatState extends State<Mat> {
  Query _ref;
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Materials')
        .orderByChild('Materials');
  }

  Widget _buildMatItem({Map mats}) {
    _launchurl() async {
      var url = mats["link"];
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
              icon: Icon(Icons.cast_for_education_rounded),
              color: Colors.blue,
              iconSize: 30,
              onPressed: _launchurl,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              mats['name'],
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
              Text(
                mats['description'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600),
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
        title: Text('Materials'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map mats = snapshot.value;
            return _buildMatItem(mats: mats);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return AddMaterials();
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
