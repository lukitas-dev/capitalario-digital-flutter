import 'package:app/features/home/models/home_info.dart';

class HomeConstants {
  static String get infoDefaults => HomeInfo(
      headerImagePath: "",
      title: "Coloque seu titulo aqui",
      subtitle: "subtitulo aqui",
      textColor: "#000000",
      buttonList: []).toJson();
}
