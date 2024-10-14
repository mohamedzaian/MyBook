import 'package:url_launcher/url_launcher.dart';

Future urlLauncher (String url)async
{
  final Uri uri =  Uri.parse(url);
  await launchUrl(uri);


}
