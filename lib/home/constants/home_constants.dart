import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:app/home/models/home_info.dart';

class HomeConstants {
  static String get infoDefaults => HomeInfo(
          backgroundImagePath: AppAssets.homeBackground.path,
          headerImagePath: "",
          title: "Instrumentos da esperança",
          subtitle: "vamos contigo Pai!",
          textColor: "#FFFFFF",
          buttonList: [
            ButtonInfo(title: "Acessar “Dá-nos Luz”", routePath: "/givenUsLight"),
            ButtonInfo(title: "Visualizar Desafios", routePath: "/challenges"),
            ButtonInfo(title: "Entrega do Capital de Graça", routePath: "/given"),
            ButtonInfo(title: "Visualizar Capitalário", routePath: "/viewer"),
          ],
          buttonStyle: ButtonStyleInfo(
              textColor: "#FFFFFF",
              borderColor: "#910909",
              backgroundColor: "#910909",
              height: 60,
              borderRadius: 30,
              textFontSize: 18))
      .toJson();
}
