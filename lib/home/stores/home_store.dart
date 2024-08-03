import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/home/models/home_info.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

typedef HomeSetupCallback = Function(HomeInfo info);

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  @observable
  AppState state = AppState.loading;

  setup(HomeSetupCallback callback) {
    var json = AppCore.config.getString(AppCore.constants.config.homeInfo);
    var info = HomeInfo.fromJson(json);
    callback(info);
    state = AppState.ready;
  }
}
