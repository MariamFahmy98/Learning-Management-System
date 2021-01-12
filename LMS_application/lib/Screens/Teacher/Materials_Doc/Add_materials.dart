import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
//import 'package:intl/intl.dart';

class NewMaterial extends StatefulWidget {
  final String courseCode;

  NewMaterial(this.courseCode);

  @override
  _NewMaterialState createState() => _NewMaterialState();
}

class _NewMaterialState extends State<NewMaterial> {
//  File _pdfFile;
  final _titleController = TextEditingController();
  final _linkController = TextEditingController();
  //DateTime _selectedDeadline;
  var _isLoading = false;

  void _addMaterial() async {
    if (_linkController.text.isEmpty) return;
    final enteredTitle = _titleController.text;
    final enteredlink = _linkController.text;

    if (enteredTitle.isEmpty || enteredlink.isEmpty) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    await Database(widget.courseCode).uploadMaterial(
      title: enteredTitle,
      link: enteredlink,
      //deadline: _selectedDeadline,
      //pdfFile: _pdfFile,
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
                decoration: InputDecoration(
                  hintText: 'Enter title',
                  prefixIcon: Icon(
                    Icons.list_alt_sharp,
                    size: 30,
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                controller: _titleController,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter link',
                  prefixIcon: Icon(
                    Icons.link,
                    size: 30,
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                controller: _linkController,
                keyboardType: TextInputType.number,
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : RaisedButton(
                      onPressed: _addMaterial,
                      child: Text(
                        'Add Material',
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