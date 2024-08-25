import 'package:app/ranking/models/ranking_info.dart';
import 'package:app/ranking/models/ranking_item_info.dart';

class RankingConstants {
  static String get infoDefaults => RankingInfo(
          toolbarTitle: "Entrega",
          itemList: [
            RankingItemInfo(
                id: "01zJFNe0InNW3tHGrUG8",
                label: "Sul",
                description: "Sul (Tabor)",
                quantity: 0),
            RankingItemInfo(
                id: "0Ida4m4zRoFfeVonrsmn",
                label: "Paraná",
                description: "Paraná (Missiones)",
                quantity: 0),
            RankingItemInfo(
                id: "0JHl0MULLK83EMpuB8dl",
                label: "Sudeste",
                description: "Sudeste (Coração Tabor)",
                quantity: 0),
            RankingItemInfo(
                id: "0PrhTexvwxNUDn2ILlta",
                label: "Nordeste",
                description: "Nordeste (Sol do Tabor)",
                quantity: 0),
          ],
          textColor: "#910909",
          hasDivider: true)
      .toJson();
}
