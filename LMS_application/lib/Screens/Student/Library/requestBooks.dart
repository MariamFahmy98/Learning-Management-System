import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ReqBooks extends StatefulWidget {
  @override
  _ReqBooksState createState() => _ReqBooksState();
}

class _ReqBooksState extends State<ReqBooks> {
  TextEditingController _bookController, _rController, _yearController;
  String _typeSelected = '';
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _bookController = TextEditingController();
    _rController = TextEditingController();
    _yearController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('booksReq');
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Request Books'),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _bookController,
                decoration: InputDecoration(
                  hintText: 'Enter Book Name',
                  prefixIcon: Icon(
                    Icons.book,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _yearController,
                decoration: InputDecoration(
                  hintText: 'Enter Release year',
                  prefixIcon: Icon(
                    Icons.calendar_today,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _rController,
                decoration: InputDecoration(
                  hintText: 'Reasons to Borrow',
                  prefixIcon: Icon(
                    Icons.question_answer,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  child: Text(
                    'Send Request',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    addRequest();
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }

  void addRequest() {
    String bookname = _bookController.text;
    String releaseYear = _yearController.text;
    String reason = _rController.text;
    Map<String, String> req = {
      'bookname': bookname,
      'year': releaseYear,
      'reason': reason,
    };
    _ref.push().set(req).then((value) {
      Navigator.pop(context);
    });
  }
}
