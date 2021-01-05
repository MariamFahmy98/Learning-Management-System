import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';


class NewAssignment extends StatefulWidget {
  @override
  _NewAssignmentState createState() => _NewAssignmentState();
}

class _NewAssignmentState extends State<NewAssignment> {
  File pdfFile;

  _pickFile() async {
    FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    ).then((value) => pdfFile = value);

    var filename = pdfFile.path.split("/").last;
    final ref = FirebaseStorage.instance
        .ref()
        .child(filename);

    await ref.putFile(pdfFile).whenComplete(() => print('Upload Complete.'));
    final url = await ref.getDownloadURL();
    print(url);
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}