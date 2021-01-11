import 'dart:math';

import 'package:flutter/material.dart';
import 'package:LMS_application/Widgets/postCard.dart';
import 'package:LMS_application/Widgets/postLists.dart';
import './Add_New_Announcement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherAnnouncements extends StatefulWidget {
  final String teacherID;
  TeacherAnnouncements(this.teacherID);

  @override
  _TeacherAnnouncementsState createState() => _TeacherAnnouncementsState();
}

class _TeacherAnnouncementsState extends State<TeacherAnnouncements> {
  void startAddNewPost(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewPost(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Announcements"),
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('/Teachers/PostDocument/Posts')
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
                    return PostCard(title, body, postTime, widget.teacherID);
                  });
            } else {
              return Center(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/announcements.png'),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewPost(context);
        },
      ),
    );
  }
}
