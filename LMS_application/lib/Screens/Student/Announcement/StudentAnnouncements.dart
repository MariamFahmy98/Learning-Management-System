import 'package:flutter/material.dart';
import 'package:LMS_application/models/course.dart';
import 'package:LMS_application/Widgets/postCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StudentAnnouncements extends StatefulWidget {
  final Course course;
  StudentAnnouncements(this.course);

  @override
  _StudentAnnouncementsState createState() => _StudentAnnouncementsState();
}

class _StudentAnnouncementsState extends State<StudentAnnouncements> {
  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    final String collectionPath =
        '/Courses/ ${widget.course.courseCode} /Announcements';
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.course.courseCode} - Announcements'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(collectionPath)
              .orderBy('postTime', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            //   if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final getPostsNum = snapshot.data.documents;
            if (getPostsNum.length >= 1) {
              return ListView.builder(
                  // itemCount should be the number of posts stored in firebase
                  itemCount: getPostsNum.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    final String title = getPostsNum[index]['title'];
                    final String body = getPostsNum[index]['body'];
                    Timestamp pTime = getPostsNum[index]['postTime'];
                    DateTime postTime = pTime.toDate();
                    return PostCard(title, body, postTime, user);
                  });
            } else
              return Text(
                "No Announcements published yet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              );
          }),
    );
  }
}