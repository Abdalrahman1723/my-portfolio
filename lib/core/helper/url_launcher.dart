import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlGlobal(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}
