//modul untuk buka googlemap

import 'package:url_launcher/url_launcher.dart'; //dari file pubspec.yaml

//buat class MapUtils
class MapUtils {
  MapUtils._();

  static Future<void> openMap(
    double? latitude,
    double? longitude,
  ) async {
    String googleMapUrl = "https://maps.google.com?q=$latitude,$longitude";
    try {
      if (await canLaunch(googleMapUrl)) {
        await launch(googleMapUrl);
      } else {
        throw Exception('Could Not Open The Map');
      }
    } catch (e) {
      // Handle exceptions, e.g., if there's a problem with the URL or launching
      print(e);
    }
  }
}
