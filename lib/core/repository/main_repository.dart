import 'package:app/core/core.dart';
import 'package:app/core/models/app_status.dart';
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
        create(quantity);
      } else {
        var status = AppStatus.fromMap(obj);
        var quantityUpdated = status.numberOfCapitalOfGrace + quantity;
        update(quantityUpdated);
      }
    }, () {});
  }

  create([int quantity = 0]) {
    var viewerInfo =
        ViewerInfo.fromJson(_config.getString(_constants.config.viewerInfo));
    var capitalOfGraceTarget = viewerInfo.gridInfo.numberOfColumns *
        viewerInfo.gridInfo.numberOfRows *
        viewerInfo.gridInfo.targetDefault;
    var status = AppStatus(
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

  update(int quantity) {
    _database.updateDocumentOnlyField(
        _constants.collections.main,
        _constants.documents.status,
        _constants.fields.numberOfCapitalOfGrace,
        quantity,
        (id) {}, () {
      // do nothing
    });
  }

  getQuantity(OnQuantityCallback callback) async {
    await _database.getDocument(
        _constants.collections.main, _constants.documents.status, (obj) async {
      if (obj == null) {
        create();
      } else {
         var status = AppStatus.fromMap(obj);
         callback(status.numberOfCapitalOfGrace);
      }
    }, () {});
  }
}
