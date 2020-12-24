import 'package:flutter/material.dart';

class TeacherAddCourse extends StatefulWidget {
  final Function addCr;
  TeacherAddCourse(this.addCr);
  @override
  _NewCourse createState() => _NewCourse();
}

class _NewCourse extends State<TeacherAddCourse> {
  final nameController = TextEditingController();
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  final creditHoursController = TextEditingController();

  void submitCourse() {
    if (nameController.text.isEmpty) {
      return;
    }

    final enteredName = nameController.text;
    final enteredCode = codeController.text;
    final enteredDescription = descriptionController.text;
    final enteredCreditHours = creditHoursController.text;

    if (enteredName.isEmpty ||
        enteredCode.isEmpty ||
        enteredDescription.isEmpty ||
        enteredCreditHours.isEmpty) {
      return;
    }
    widget.addCr(
      enteredName,
      enteredCode,
      enteredDescription,
      enteredCreditHours,
    );
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
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
              onSubmitted: (_) => submitCourse(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Code'),
              controller: codeController,
              onSubmitted: (_) => submitCourse(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
              controller: descriptionController,
              onSubmitted: (_) => submitCourse(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Credit Hours'),
              controller: creditHoursController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitCourse(),
            ),
            RaisedButton(
              child: Text('Add Course'),
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              onPressed: submitCourse,
            ),
          ],
        ),
      ),
    );
  }
}
