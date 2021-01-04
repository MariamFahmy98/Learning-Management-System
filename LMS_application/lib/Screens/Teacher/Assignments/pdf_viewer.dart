import 'package:LMS_application/Screens/Teacher/Assignments/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PDFViewer extends StatefulWidget {
  final String url;

  PDFViewer(this.url);

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  String _localFile;
  var _isLoading = true;

  @override
  void initState() {
    super.initState();
    ApiService(widget.url).loadPDF.then((value) {
      _localFile = value;
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
        centerTitle: true,
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : PDFView(
                filePath: _localFile,
              ),
      ),
    );
  }
}
