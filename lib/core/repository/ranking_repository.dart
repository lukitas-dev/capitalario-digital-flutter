import 'dart:developer';

import 'package:app/core/core.dart';
import 'package:app/core/repository/app_repository.dart';
import 'package:app/ranking/models/ranking_info.dart';

class RankingRepository {
  final _config = AppCore.config;
  final _constants = AppCore.constants;
  final _database = AppCore.database;
  final _collection = AppCore.constants.collections.ranking;

  createRanking(OnSuccessCallback success) async {
    log("start ranking creation");
    var rankingInfo =
        RankingInfo.fromJson(_config.getString(_constants.config.rankingInfo));
    for (var item in rankingInfo.itemList) {
      await _database.addDocumentWithId(_collection, item.id, item.toMap(),
          (result) {
        log("add ${item.label} on ranking");
      }, () {});
    }
    success("ranking created");
  }

  updateRanking(String description, int quantity) async {
    var docId = _getDocIdFromDescription(description);
    await _database.updateDocumentOnlyField(_collection, docId,
        _constants.fields.quantity, quantity, (success) {}, () {});
  }

  getRankingItem(String description, OnGetDocCallback success) async {
    var docId = _getDocIdFromDescription(description);
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

  String _getDocIdFromDescription(String description) {
    var rankingInfo =
        RankingInfo.fromJson(_config.getString(_constants.config.rankingInfo));
    for (var item in rankingInfo.itemList) {
      if (item.description == description) {
        return item.id;
      }
    }
    return "ID000";
  }
}
