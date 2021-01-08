import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Addofficehours extends StatefulWidget {
  @override
  _AddofficehoursState createState() => _AddofficehoursState();
}

class _AddofficehoursState extends State<Addofficehours> {
  TextEditingController _nameController, _numberController, _dayController;
  String _typeSelected = '';

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _dayController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('officehours');
  }

  Widget _buildofficehourType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
          color: _typeSelected == title
              ? Colors.green
              : Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _typeSelected = title;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save officehour'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            TextFormField(
              controller: _dayController,
              decoration: InputDecoration(
                hintText: 'Enter day',
                prefixIcon: Icon(
                  Icons.calendar_today,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Enter clock',
                prefixIcon: Icon(
                  Icons.lock_clock,
                  size: 30,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildofficehourType('online'),
                  SizedBox(width: 10),
                  _buildofficehourType('offline'),
                  SizedBox(width: 10),
                ],
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
                  'Save officehour',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  saveofficehour();
                },
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveofficehour() {
    String name = _nameController.text;
    String number = _numberController.text;
    String day = _dayController.text;

    Map<String, String> officehour = {
      'name': name,
      'number': number,
      'type': _typeSelected,
      'day': day,
    };

    _ref.push().set(officehour).then((value) {
      Navigator.pop(context);
    });
  }
}
