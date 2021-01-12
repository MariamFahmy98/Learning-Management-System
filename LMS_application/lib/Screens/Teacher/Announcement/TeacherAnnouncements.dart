import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';
import 'package:LMS_application/Widgets/postCard.dart';
import './Add_New_Announcement.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TeacherAnnouncements extends StatefulWidget {
  final Course course;
  TeacherAnnouncements(this.course);

  @override
  _TeacherAnnouncementsState createState() => _TeacherAnnouncementsState();
}

class _TeacherAnnouncementsState extends State<TeacherAnnouncements> {
  void startAddNewPost(BuildContext ctx, Course course) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: AddNewPost(course),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String collectionPath =
        '/Courses/ ${widget.course.courseCode} /Announcements';
    var user = FirebaseAuth.instance.currentUser;
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
            } else {
              return Center(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('images/announcements.png'),
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewPost(context, widget.course);
        },
      ),
    );
  }
}
