import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_colors.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/ranking/models/ranking_info.dart';
import 'package:app/ranking/models/ranking_item_info.dart';
import 'package:app/ranking/stores/ranking_store.dart';
import 'package:flutter/material.dart';

class RankingController {
  RankingStore store = RankingStore();
  late RankingInfo info;
  late List<RankingItemInfo> itemList;
  final AppColors _colors = AppCore.infra.colors;

  setup() async {
    await store.setup((rankingInfo, rankingItemList) {
      info = rankingInfo;
      itemList = rankingItemList;
    });
  }

  String getTitle() {
    return "Ranking";
  }

  AppState getState() {
    return store.state;
  }

  List<Widget> buildRankingItemList(BuildContext context) {
    itemList.sort((RankingItemInfo a, RankingItemInfo b) {
      if (a.quantity < b.quantity) {
        return -1;
      } else if (a.quantity > b.quantity) {
        return 1;
      } else {
        return 0;
      }
    });
    itemList = itemList.reversed.toList();
    List<Widget> widgetList = [];
    for (var i = 0; i < itemList.length; i++) {
      var item = itemList[i];
      widgetList.add(ListTile(
        leading: Text(
          "#${i + 1}",
          style: TextStyle(
              color: _colors.fromHex(info.textColor),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        title: Text(
          item.name,
          style: TextStyle(
              color: _colors.fromHex(info.textColor),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          item.quantity.toString(),
          style: TextStyle(
              color: _colors.fromHex(info.textColor),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        contentPadding:
            const EdgeInsets.only(left: 24, top: 8, bottom: 8, right: 24),
      ));
      widgetList.add(Divider(
        color: _colors.greyLight,
        height: 2,
      ));
    }
    return widgetList;
  }
}
