import 'package:app/core/core.dart';
import 'package:app/core/repository/app_repository.dart';
import 'package:app/given/models/capital_info.dart';

class GivenRepository {
  addCapital(
      CapitalInfo info, OnSuccessCallback callback, OnErrorCallback error) {
    AppCore.database.addDocument(
        AppCore.constants.collections.given, info.toMap(), callback, error);
  }
}
