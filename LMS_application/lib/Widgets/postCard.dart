import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String postTitle;
  final String postBody;
  PostCard(this.postTitle, this.postBody);
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
              // _PostDetails(),
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

/*class _PostDetails extends StatelessWidget {
  const _PostDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        // _UserImage(),
        _UserNameAndEmail(),
        _PostTimeStamp(),
      ],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle nameTheme = Theme.of(context).textTheme.subtitle;
    final TextStyle emailTheme = Theme.of(context).textTheme.body1;

    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DemoValues.userName, style: nameTheme),
            SizedBox(height: 2.0),
            Text(DemoValues.userEmail, style: emailTheme),
          ],
        ),
      ),
    );
  }
}

class _PostTimeStamp extends StatelessWidget {
  const _PostTimeStamp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle timeTheme = TextThemes.dateStyle;
    return Expanded(
      flex: 2,
      child: Text(DemoValues.postTime, style: timeTheme),
    );
  }
} */
