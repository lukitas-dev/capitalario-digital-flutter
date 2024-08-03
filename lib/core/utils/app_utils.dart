import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  static openUrl(String url) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static String getDateNow() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(now);
  }

  static String getTimestampFile() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyyMMdd');
    return formatter.format(now);
  }
  
}