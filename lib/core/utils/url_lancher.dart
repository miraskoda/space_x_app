import 'package:url_launcher/url_launcher_string.dart';

class UrlLauncher {
  static launchURL(String url) async {
    if (!await launchUrlString(url)) throw 'Could not launch $url';
  }
}
