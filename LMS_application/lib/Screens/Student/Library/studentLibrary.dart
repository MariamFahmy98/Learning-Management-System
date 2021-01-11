import 'package:LMS_application/Screens/Student/Library/requestBooks.dart';
import 'package:LMS_application/Screens/Teacher/library/addBooks.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:url_launcher/url_launcher.dart';

class SLibrary extends StatefulWidget {
  @override
  _SLibraryState createState() => _SLibraryState();
}

class _SLibraryState extends State<SLibrary> {
  Query _ref;
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('booksName')
        .orderByChild('booksName');
  }

  Widget _buildBookItem({Map books}) {
    _launchurl() async {
      var url = books["link"];
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
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: <Widget>[
            IconButton(
              icon: Icon(Icons.picture_as_pdf),
              color: Colors.blue,
              iconSize: 30,
              onPressed: _launchurl,
            ),
            SizedBox(
              width: 6,
            ),
            Text(
              books['bookname'],
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
                Icons.person_outline,
                color: Colors.blue,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                books['author'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 15),
              Icon(
                Icons.flag,
                color: Colors.blue,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                books['type'],
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Prof. to LMS library'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map books = snapshot.value;
            return _buildBookItem(books: books);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ReqBooks();
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
