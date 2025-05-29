import 'package:url_launcher/url_launcher.dart';

launchUri(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    //throw 'Could not open the map.';
  }
}
