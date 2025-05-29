import 'package:url_launcher/url_launcher.dart';

class Contact {
  static call(String phoneNumber) async {
    phoneNumber = phoneNumber.substring(1);
    Uri url = Uri();
    url = Uri.parse("tel://+213$phoneNumber");
    _urlLaunch(url);
  }

  static _urlLaunch(Uri url) async {
    await canLaunchUrl(url)
        ? await launchUrl(url, mode: LaunchMode.externalApplication)
        : () {};
  }
}
