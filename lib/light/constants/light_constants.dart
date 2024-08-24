import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';
import 'package:app/light/models/light_info.dart';

class LightConstants {
  static String get infoDefaults => LightInfo(
          toolbarTitle: "Dá-nos Luz",
          buttonList: [
            ButtonInfo(
                title: "Capíitulo I", routePath: "https://drive.google.com/file/d/1dB8feisqQrVgV9y-Z3MspQHKSaUHNNha/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo II", routePath: "https://drive.google.com/file/d/1dB8feisqQrVgV9y-Z3MspQHKSaUHNNha/view?usp=sharing"),
            ButtonInfo(
                title: "Capíitulo III", routePath: "https://drive.google.com/file/d/1dB8feisqQrVgV9y-Z3MspQHKSaUHNNha/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo IV", routePath: "https://drive.google.com/file/d/1dB8feisqQrVgV9y-Z3MspQHKSaUHNNha/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo V", routePath: "https://drive.google.com/file/d/1dB8feisqQrVgV9y-Z3MspQHKSaUHNNha/view?usp=sharing"),
            ButtonInfo(title: "Capíitulo VI", routePath: "https://drive.google.com/file/d/1dB8feisqQrVgV9y-Z3MspQHKSaUHNNha/view?usp=sharing"),
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
