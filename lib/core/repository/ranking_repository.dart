import 'dart:developer';

import 'package:app/core/core.dart';
import 'package:app/core/repository/app_repository.dart';
import 'package:app/core/utils/app_utils.dart';
import 'package:app/ranking/models/ranking_info.dart';
import 'package:app/ranking/models/ranking_item_info.dart';

class RankingRepository {
  final _config = AppCore.config;
  final _constants = AppCore.constants;
  final _database = AppCore.database;
  final _collection = AppCore.constants.collections.ranking;

  createRanking(OnSuccessCallback success) async {
    log("start ranking creation");
    var rankingInfo =
        RankingInfo.fromJson(_config.getString(_constants.config.rankingInfo));
    for (var i = 0; i < rankingInfo.idItemList.length; i++) {
      var itemInfo =
          RankingItemInfo(name: rankingInfo.labelItemList[i], quantity: 0);
      var docId = AppUtils.getDocIdFromString(rankingInfo.idItemList[i]);
      await _database.addDocumentWithId(
          _collection, docId, itemInfo.toMap(), (result) {
        log("add ${rankingInfo.labelItemList[i]} on ranking");
      }, () {});
    }
    success("ranking created");
  }

  updateRanking(String id, int quantity) async {
    var docId = AppUtils.getDocIdFromString(id);
    await _database.updateDocumentOnlyField(_collection, docId,
        _constants.fields.quantity, quantity, (success) {}, () {});
  }

  getRankingItem(String id, OnGetDocCallback success) async {
    var docId = AppUtils.getDocIdFromString(id);
    await _database.getDocument(_collection, docId, (obj) async {
      if (obj == null) {
        createRanking((result) {
          log(result);
        });
      } else {
        success(obj);
      }
    }, () {});
  }

  getRankingList(OnGetAllCallback success) async {
    await _database.getAllDocuments(_collection, success, () {});
  }
}
