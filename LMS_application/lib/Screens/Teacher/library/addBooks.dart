import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddBooks extends StatefulWidget {
  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  TextEditingController _bookNameController, _desController, _webLink;
  String _typeSelected = '';
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _bookNameController = TextEditingController();
    _desController = TextEditingController();
    _webLink = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('booksName');
  }

  Widget _buildBookType(String type) {
    return InkWell(
        child: Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
            color: _typeSelected == type ? Colors.red : Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _typeSelected = type;
          });
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Books'),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _bookNameController,
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
                controller: _desController,
                decoration: InputDecoration(
                  hintText: 'Enter Author Name',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _webLink,
                decoration: InputDecoration(
                  hintText: 'Enter Link',
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
                height: 40,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildBookType('General'),
                    SizedBox(width: 10),
                    _buildBookType('Electrical'),
                    SizedBox(width: 10),
                    _buildBookType('Civil'),
                    SizedBox(width: 10),
                    _buildBookType('Mech.'),
                    SizedBox(width: 10),
                    _buildBookType('Arch.'),
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
                    'Add Book to Library',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    addBook();
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }

  void addBook() {
    String bookname = _bookNameController.text;
    String author = _desController.text;
    String link = _webLink.text;
    Map<String, String> book = {
      'bookname': bookname,
      'author': author,
      'type': _typeSelected,
      'link': link,
    };
    _ref.push().set(book).then((value) {
      Navigator.pop(context);
    });
  }
}
