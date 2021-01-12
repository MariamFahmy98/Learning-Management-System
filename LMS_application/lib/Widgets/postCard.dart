import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:LMS_application/services/DataBase2.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
  final String postTitle;
  final String postBody;
  final DateTime postTime;
  var teacherID;
  PostCard(this.postTitle, this.postBody, this.postTime, this.teacherID);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 3,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(4.0),
          height: double.infinity,
          child: Column(
            children: <Widget>[
              _PostDetails(teacherID, postTime),
              Divider(color: Colors.grey),
              _Post(postTitle, postBody),
            ],
          ),
        ),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  final String postTitle;
  final String postBody;
  _Post(this.postTitle, this.postBody);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _PostTitleAndBody(postTitle, postBody),
          //Divider(color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up),
                tooltip: 'like',
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble),
                tooltip: 'Write a comment',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PostTitleAndBody extends StatelessWidget {
  final String postTitle;
  final String postBody;
  _PostTitleAndBody(this.postTitle, this.postBody);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 2,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                postTitle,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.0),
              Text(postBody),
            ],
          ),
        ),
      ),
    );
  }
}

class _PostDetails extends StatelessWidget {
  var teacherID;
  final DateTime postTime;
  _PostDetails(this.teacherID, this.postTime);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(6),
            child: _UserImage(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // _UserImage(),
              SizedBox(height: 10),
              _UserName(teacherID),
              _PostTimeStamp(postTime),
            ],
          ),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _UserName extends StatelessWidget {
  var teacherID;
  _UserName(this.teacherID);
  //var user = FirebaseAuth.instance.currentUser();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StreamBuilder<Teacher>(
            //stream: Database(teacherID).teacherData,
            builder: (context, snapshot) {
          return Text(
            //snapshot.data.name,
            "Ahmed Essam",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
    );
  }
}

class _PostTimeStamp extends StatelessWidget {
  final DateTime postTime;
  _PostTimeStamp(this.postTime);
  String timeUntil() {
    return timeago.format(postTime, allowFromNow: true);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: postTime != null
            ? Text(
                timeUntil(),
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text("null"));
  }
}
