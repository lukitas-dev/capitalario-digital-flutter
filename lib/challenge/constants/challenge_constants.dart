import 'package:app/challenge/models/challenge_info.dart';
import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/models/button_info.dart';
import 'package:app/core/models/button_style_info.dart';

class ChallengeConstants {
  static String get infoDefaults => ChallengeInfo(
          toolbarTitle: "Desafios",
          backgroundImagePath: AppAssets.challengeBackground.path,
          buttonList: [
            ButtonInfo(
                title: "Jufem a Caminho", routePath: "/challengesDetails"),
            ButtonInfo(title: "Dá-nos Luz", routePath: "/givenUsLight"),
          ],
          buttonDetailList: [
            ButtonInfo(
                title: "Maio - 2024",
                routePath:
                    "https://drive.google.com/file/d/1yAJ45sgXAJzeyZeavsryYG_zmAR8HyMP/view?usp=sharing"),
            ButtonInfo(
                title: "Junho - 2024",
                routePath:
                    "https://drive.google.com/file/d/1VcEiXzhb7km5B94aJYQWmD8GG9ZgfDuW/view?usp=sharing"),
            ButtonInfo(
                title: "Julho - 2024",
                routePath:
                    "https://drive.google.com/file/d/1fNBuIW2kRwffjOPfN1clDHPJGD8PtB6U/view?usp=sharing"),
            ButtonInfo(
                title: "Agosto - 2024",
                routePath:
                    "https://drive.google.com/file/d/1Okgd8HPNibGzKzeYGT9PGO6Vp05tc-jG/view?usp=sharing"),
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
