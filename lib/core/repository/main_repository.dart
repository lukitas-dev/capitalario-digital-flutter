import 'package:app/core/core.dart';
import 'package:app/core/repository/models/status_info.dart';
import 'package:app/core/repository/app_repository.dart';
import 'package:app/viewer/models/viewer_info.dart';

class MainRepository {
  final _constants = AppCore.constants;
  final _database = AppCore.database;
  final _config = AppCore.config;

  createOrUpdateStatus(int quantity) async {
    await _database.getDocument(
        _constants.collections.main, _constants.documents.status, (obj) async {
      if (obj == null) {
        createStatus(quantity);
      } else {
        var status = StatusInfo.fromMap(obj);
        var quantityUpdated = status.numberOfCapitalOfGrace + quantity;
        updateStatus(status, quantityUpdated);
      }
    }, () {});
  }

  createStatus([int quantity = 0]) {
    var viewerInfo =
        ViewerInfo.fromJson(_config.getString(_constants.config.viewerInfo));
    var capitalOfGraceTarget = viewerInfo.gridInfo.numberOfColumns *
        viewerInfo.gridInfo.numberOfRows *
        viewerInfo.gridInfo.targetDefault;
    var status = StatusInfo(
        capitalOfGraceTarget: capitalOfGraceTarget,
        numberOfBlocks: viewerInfo.boxList.length,
        numberOfCapitalOfGrace: quantity,
        numberOfCompletedBlocks: 0,
        numberOfSendedCapitalOfGrace: 1);
    _database.addDocumentWithId(_constants.collections.main,
        _constants.documents.status, status.toMap(), (id) {}, () {
      // do nothing
    });
  }

  updateStatus(StatusInfo status, int quantity) {
    var statusMap = status.toMap();
    statusMap[_constants.fields.numberOfCapitalOfGrace] = quantity;
    statusMap[_constants.fields.numberOfSendedCapitalOfGrace] = status.numberOfSendedCapitalOfGrace + 1;
    _database.updateDocument(
        _constants.collections.main,
        _constants.documents.status,
        statusMap,
        (id) {}, () {
      // do nothing
    });
  }

  getQuantity(OnQuantityCallback callback) async {
    await _database.getDocument(
        _constants.collections.main, _constants.documents.status, (obj) async {
      if (obj == null) {
        createStatus();
      } else {
        var status = StatusInfo.fromMap(obj);
        callback(status.numberOfCapitalOfGrace);
      }
    }, () {});
  }
}
