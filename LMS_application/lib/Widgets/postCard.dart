import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:LMS_application/models/teacher.dart';
import 'package:LMS_application/services/DataBase2.dart';

class PostCard extends StatelessWidget {
  final String postTitle;
  final String postBody;
  final DateTime postTime;
  final String teacherID;
  PostCard(this.postTitle, this.postBody, this.postTime, this.teacherID);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 6 / 3,
      child: Card(
        elevation: 2,
        child: Container(
          margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(4.0),
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
      child: Row(children: <Widget>[_PostTitleAndBody(postTitle, postBody)]),
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
        //     PostTimeStamp(alignment: Alignment.centerRight),
      ),
    );
  }
}

class _PostDetails extends StatelessWidget {
  final String teacherID;
  final DateTime postTime;
  _PostDetails(this.teacherID, this.postTime);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Row(
        children: <Widget>[
          // _UserImage(),
          _UserName(teacherID),
          _PostTimeStamp(postTime),
        ],
      ),
    );
  }
}

/*class _UserImage extends StatelessWidget {
  const _UserImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserModel userData = InheritedUserModel.of(context).userData;
    return Expanded(
      flex: 1,
      child: CircleAvatar(backgroundImage: AssetImage(userData.image)),
    );
  }
} */
class _UserName extends StatelessWidget {
  final String teacherID;
  _UserName(this.teacherID);
  var user = FirebaseAuth.instance.currentUser();
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: StreamBuilder<Teacher>(
            stream: Database(teacherID).teacherData,
            builder: (context, snapshot) {
              return Text(snapshot.data.name);
            }),
      ),
    );
  }
}

class _PostTimeStamp extends StatelessWidget {
  final DateTime postTime;
  _PostTimeStamp(this.postTime);
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 2,
        child: postTime != null
            ? Text(
                DateFormat.yMMMMEEEEd().format(postTime),
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )
            : Text("null"));
  }
}
