import 'package:app/core/constants/constants.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/viewer/models/viewer_info.dart';
import 'package:mobx/mobx.dart';
part 'viewer_store.g.dart';

typedef ViewerSetupCallback = Function(ViewerInfo info, int totalOfGiven);

class ViewerStore = _ViewerStoreBase with _$ViewerStore;

abstract class _ViewerStoreBase with Store {
  @observable
  AppState state = AppState.loading;

  setup(ViewerSetupCallback callback) {
    var json = AppCore.config.getString(AppConstants.viewerInfoKey);
    var info = ViewerInfo.fromJson(json);
    // is necessary to get main statis with the information, in this moment will be hard code
    callback(info, 100);
    state = AppState.ready;
  }
}