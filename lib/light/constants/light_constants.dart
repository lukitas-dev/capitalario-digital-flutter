import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:app/light/models/light_info.dart';

class LightConstants {
  static String get infoDefaults => LightInfo(
          toolbarTitle: "Dá-nos Luz",
          buttonList: [
            ButtonInfo(
                title: "Capíitulo I", routePath: "https://drive.google.com/file/d/1qM_BRemnIknmasVaEqraZamXLrPkpDsl/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo II", routePath: "https://drive.google.com/file/d/1EUnWsLG7z52qHW3_Gw2enOghQy1WSsyp/view?usp=sharing"),
            ButtonInfo(
                title: "Capíitulo III", routePath: "https://drive.google.com/file/d/1msQCKIVP9to8TgRq90lc3AGqvEkFrC1G/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo IV", routePath: "https://drive.google.com/file/d/1Y4b_mupetUJQWT3snwNo6RANpfq85jRZ/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo V", routePath: "https://drive.google.com/file/d/1YiSrEEz5ja2MAerF5S6WOxIH2-CvXp0K/view?usp=sharing"),
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
