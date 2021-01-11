import 'package:LMS_application/services/DataBase2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewOfficehour extends StatefulWidget {
  final String courseCode;

  NewOfficehour(this.courseCode);

  @override
  _NewOfficehourState createState() => _NewOfficehourState();
}

class _NewOfficehourState extends State<NewOfficehour> {
  final _placeController = TextEditingController();
  final _nameController = TextEditingController();

  DateTime _selectedappointment;
  var _isLoading = false;

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
            _selectedappointment = DateTime(
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

  void _addOfficehour() async {
    final enteredPlace = _placeController.text;
    final enteredname = _nameController.text;

    if (enteredPlace.isEmpty ||
        enteredname.isEmpty ||
        _selectedappointment == null) return;

    FocusScope.of(context).unfocus();
    setState(() => _isLoading = true);

    await Database(widget.courseCode).uploadOfficehour(
      name: enteredname,
      place: enteredPlace,
      appointment: _selectedappointment,
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
                  hintText: 'Enter name',
                  prefixIcon: Icon(
                    Icons.supervised_user_circle,
                    size: 30,
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                controller: _nameController,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter place',
                  prefixIcon: Icon(
                    Icons.place,
                    size: 30,
                  ),
                  fillColor: Colors.purple[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
                controller: _placeController,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedappointment == null
                            ? 'No Chosen officehour!'
                            : 'Picked appointment: \n${DateFormat.MMMEd().format(_selectedappointment)}   ${DateFormat.jm().format(_selectedappointment)}',
                      ),
                    ),
                    FlatButton(
                      onPressed: _presentDateTimePricker,
                      child: Text(
                        'Choose appointment',
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
                      onPressed: _addOfficehour,
                      child: Text(
                        'Add Officehour',
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
