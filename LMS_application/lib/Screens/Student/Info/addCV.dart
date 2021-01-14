import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

String link;

class AddCV extends StatefulWidget {
  @override
  _AddCVState createState() => _AddCVState();
}

class _AddCVState extends State<AddCV> {
  TextEditingController _name, _link;
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _link = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('CVs');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add CV'),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter Your Name',
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
                controller: _link,
                decoration: InputDecoration(
                  hintText: 'Enter CV Link',
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
                    'Add CV',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    link = _link.text;
                    addCV();
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }

  void addCV() {
    String name = _name.text;
    String link = _link.text;

    Map<String, String> cv = {
      'name': name,
      'link': link,
    };
    _ref.push().set(cv).then((value) {
      Navigator.pop(context);
    });
  }

  String addCVwithLink() {
    String link = _link.text;
    return link;
  }
}
