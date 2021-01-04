import 'package:flutter/material.dart';

class CustomeTile extends StatelessWidget {
  final IconData myIcon;
  final String txt;
  final Function onTap;

  CustomeTile({@required this.myIcon, @required this.txt, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.purple,
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))),
          height: 50.0,
          child: Row(
            children: <Widget>[
              Icon(myIcon),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  txt,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
