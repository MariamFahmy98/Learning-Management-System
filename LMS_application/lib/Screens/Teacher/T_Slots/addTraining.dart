import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddTrainings extends StatefulWidget {
  @override
  _AddTrainingsState createState() => _AddTrainingsState();
}

class _AddTrainingsState extends State<AddTrainings> {
  TextEditingController _name, _des, _link;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _des = TextEditingController();
    _link = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Trainings');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Trainings'),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter Training Name',
                  prefixIcon: Icon(
                    Icons.list_alt_sharp,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _des,
                decoration: InputDecoration(
                  hintText: 'Enter Descritpion',
                  prefixIcon: Icon(
                    Icons.border_color,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _link,
                decoration: InputDecoration(
                  hintText: 'Enter Your Email',
                  prefixIcon: Icon(
                    Icons.link,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  child: Text(
                    'Add Trainings',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    addTraining();
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }

  void addTraining() {
    String name = _name.text;
    String des = _des.text;
    String link = _link.text;

    Map<String, String> training = {
      'name': name,
      'description': des,
      'link': link,
    };
    _ref.push().set(training).then((value) {
      Navigator.pop(context);
    });
  }
}