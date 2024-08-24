import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/repository/app_repository.dart';
import 'package:app/viewer/models/viewer_info.dart';
import 'package:mobx/mobx.dart';
part 'viewer_store.g.dart';

typedef ViewerSetupCallback = Function(ViewerInfo info, int totalOfGiven);

class ViewerStore = _ViewerStoreBase with _$ViewerStore;

abstract class _ViewerStoreBase with Store {
  @observable
  AppState state = AppState.loading;

  Future<void> setup(ViewerSetupCallback callback) async {
    var json = AppCore.config.getString(AppCore.constants.config.viewerInfo);
    var info = ViewerInfo.fromJson(json);

    await AppRepository.main.getQuantity((quantity) {
      callback(info, quantity);
      state = AppState.ready;
    });
  }
}
