import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddMaterials extends StatefulWidget {
  @override
  _AddMaterialsState createState() => _AddMaterialsState();
}

class _AddMaterialsState extends State<AddMaterials> {
  TextEditingController _name, _des, _link;
  String _typeSelected = '';
  DatabaseReference _ref;

  @override
  void initState() {
    super.initState();
    _name = TextEditingController();
    _des = TextEditingController();
    _link = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Materials');
  }

  Widget _buildBookType(String type) {
    return InkWell(
        child: Container(
          height: 40,
          width: 90,
          decoration: BoxDecoration(
            color: _typeSelected == type ? Colors.red : Colors.blueAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              type,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            _typeSelected = type;
          });
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add Materials'),
        ),
        body: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: 'Enter Material Name',
                  prefixIcon: Icon(
                    Icons.list_alt_sharp,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _des,
                decoration: InputDecoration(
                  hintText: 'Enter Descritpion',
                  prefixIcon: Icon(
                    Icons.border_color,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _link,
                decoration: InputDecoration(
                  hintText: 'Enter Link',
                  prefixIcon: Icon(
                    Icons.link,
                    size: 30,
                  ),
                  fillColor: Colors.blue[50],
                  filled: true,
                  contentPadding: EdgeInsets.all(15),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RaisedButton(
                  child: Text(
                    'Add Materials',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    addBook();
                  },
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ));
  }

  void addBook() {
    String name = _name.text;
    String des = _des.text;
    String link = _link.text;

    Map<String, String> material = {
      'name': name,
      'description': des,
      'link': link,
    };
    _ref.push().set(material).then((value) {
      Navigator.pop(context);
    });
  }
}
