import 'dart:io';

import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';

class NewAssignment extends StatefulWidget {
  final String courseCode;

  NewAssignment(this.courseCode);

  @override
  _NewAssignmentState createState() => _NewAssignmentState();
}

class _NewAssignmentState extends State<NewAssignment> {
  File _pdfFile;
  final _titleController = TextEditingController();
  final _gradeController = TextEditingController();
  DateTime _selectedDeadline;
  var _isLoading = false;

  _pickFile() async {
    FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    ).then((value) => setState(() => _pdfFile = value));
  }

  void _presentDateTimePricker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(DateTime.now().year + 1))
        .then((pickedDate) {
      if (pickedDate == null) return;

      showTimePicker(context: context, initialTime: TimeOfDay.now()).then(
        (pickedTime) {
          if (pickedDate == null) return;

          setState(() {
            _selectedDeadline = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
          });
        },
      );
    });
  }

  void _addAssignment() async {
    if (_gradeController.text.isEmpty) return;
    final enteredTitle = _titleController.text;
    final enteredGrade = double.parse(_gradeController.text, (source) => -1);

    if (enteredTitle.isEmpty ||
        enteredGrade <= 0 ||
        _pdfFile == null ||
        _selectedDeadline == null) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    await Database(widget.courseCode).uploadAssignment(
      title: enteredTitle,
      grade: enteredGrade.toStringAsFixed(0),
      deadline: _selectedDeadline,
      pdfFile: _pdfFile,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Grade'),
                controller: _gradeController,
                keyboardType: TextInputType.number,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDeadline == null
                            ? 'No Chosen Deadline!'
                            : 'Picked Deadline: \n${DateFormat.MMMEd().format(_selectedDeadline)}   ${DateFormat.jm().format(_selectedDeadline)}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _presentDateTimePricker,
                      child: Text(
                        'Choose Deadline',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _pdfFile == null
                            ? 'No Chosen File!'
                            : 'Picked File: \n${_pdfFile.path.split("/").last}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _pickFile,
                      child: Text(
                        'Choose File',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      textColor: Theme.of(context).primaryColor,
                    )
                  ],
                ),
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: _addAssignment,
                      child: Text(
                        'Add Assignment',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).textTheme.button.color,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
