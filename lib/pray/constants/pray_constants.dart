import 'package:app/pray/models/pray_info.dart';

class PrayConstants {
  static String get infoDefaults =>
      PrayInfo(headerImagePath: "", title: "Confio", text: "Confio...")
          .toJson();
}
