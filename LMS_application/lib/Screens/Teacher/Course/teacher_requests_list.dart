import 'package:LMS_application/models/course.dart';
import 'package:flutter/material.dart';

class RequestsPage extends StatelessWidget {
  final Course requestedCr = new Course();
  //RequestsPage(this.requestedCr);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            elevation: 15,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: FittedBox(
                    child: Text(
                      requestedCr.courseCode,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              title: Text(
                requestedCr.requests[index].name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'MMMMMMMMMMMMM',
                    // '${requestedCr.requests[index].code}',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FlatButton(
                        child: Text('Approve'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Text('Disapprove'),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: requestedCr.requests.length,
      ),
    );
  }
}
