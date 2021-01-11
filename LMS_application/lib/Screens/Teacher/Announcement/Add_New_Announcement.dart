import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddNewPost extends StatefulWidget {
  // final Function addPost;
  // AddNewPost(this.addPost);
  @override
  _AddNewPostState createState() => _AddNewPostState();
}

class _AddNewPostState extends State<AddNewPost> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final authorController = TextEditingController();
  void submitPost() {
    if (titleController.text.isEmpty || bodyController.text.isEmpty) return;
    FirebaseFirestore.instance.collection('/Teachers/PostDocument/Posts').add({
      'title': titleController.text,
      'body': bodyController.text,
      'postTime': DateTime.now(),
    });
    /* widget.addPost(
        titleController.text, bodyController.text, authorController.text); */
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) {},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Body'),
              controller: bodyController,
              onSubmitted: (_) {},
            ),
            RaisedButton(
              child: Text('Add Post'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: submitPost,
            ),
          ],
        ),
      ),
    );
  }
}
