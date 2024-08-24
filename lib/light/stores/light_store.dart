import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/light/models/light_info.dart';
import 'package:mobx/mobx.dart';
part 'light_store.g.dart';

typedef LightSetupCallback = Function(LightInfo info);

class LightStore = _LightStoreBase with _$LightStore;

abstract class _LightStoreBase with Store {
    @observable
    AppState state = AppState.loading;

    setup(LightSetupCallback callback) {
      var json = AppCore.config.getString(AppCore.constants.config.lightInfo);
      var info = LightInfo.fromJson(json);
      callback(info);
      state = AppState.ready;
    }
}