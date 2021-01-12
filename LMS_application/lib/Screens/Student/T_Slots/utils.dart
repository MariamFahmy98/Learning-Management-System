import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

class Utils {
  static Future openlink({@required String url}) => _launchUrl(url);

  static _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future openEmail({String toEmail, String subject, String body}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    print(toEmail);
    await _launchUrl(url);
  }
}
