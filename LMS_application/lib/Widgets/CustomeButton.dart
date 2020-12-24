import 'package:flutter/material.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  BuildContext context;
  CustomeButton({this.title, this.context});

  @override
  Widget build(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
