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
            ButtonInfo(title: "Acessar “Dá-nos Luz”", routePath: "/test"),
            ButtonInfo(title: "Visualizar Desafios", routePath: "/test"),
            ButtonInfo(title: "Entrega do Capital de Graça", routePath: "/test"),
            ButtonInfo(title: "Visualizar Capitalário", routePath: "/test"),
            ButtonInfo(title: "Visualizar Ranking", routePath: "/test"),
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
