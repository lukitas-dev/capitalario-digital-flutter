import 'package:app/ranking/models/ranking_info.dart';

class RankingConstants {
  static String get infoDefaults => RankingInfo(
          toolbarTitle: "Entrega",
          idItemList: [
            "Sul (Tabor)",
            "Paraná (Missiones)",
            "Sudeste (Coração Tabor)",
            "Nordeste (Sol do Tabor)"
          ],
          labelItemList: ["Sul", "Paraná", "Sudeste", "Nordeste"],
          textColor: "#910909",
          hasDivider: true)
      .toJson();
}
