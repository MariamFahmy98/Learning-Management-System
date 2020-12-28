import 'package:flutter/material.dart';
import 'package:LMS_application/Widgets/postCard.dart';
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
              .snapshots(),
          builder: (context, snapshot) {
            //   if (!snapshot.hasData) return CircularProgressIndicator();
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final getPostsNum = snapshot.data.documents;
            return ListView.builder(
                // itemCount should be the number of posts stored in firebase
                itemCount: getPostsNum.length,
                itemBuilder: (BuildContext context, int index) {
                  final String title = getPostsNum[index]['title'];
                  final String body = getPostsNum[index]['body'];
                  return PostCard(title, body);
                });
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
