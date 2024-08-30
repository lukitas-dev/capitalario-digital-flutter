import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:app/home/models/home_info.dart';

class HomeConstants {
  static String get infoDefaults => HomeInfo(
          backgroundImagePath: AppAssets.homeBackground.path,
          headerImagePath: "",
          title: "Coloque seu titulo aqui",
          subtitle: "subtitulo aqui",
          textColor: "#000000",
          buttonList: [
            ButtonInfo(menuIndex: 1, title: "Botao A", routePath: "/test")
          ],
          buttonStyle: ButtonStyleInfo(
              textColor: "#FFFFFF",
              borderColor: "#3e2b16",
              backgroundColor: "#3e2b16",
              height: 60,
              borderRadius: 30,
              textFontSize: 22))
      .toJson();
}
