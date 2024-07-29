import 'package:app/core/constants/constants.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/pray/models/pray_info.dart';
import 'package:mobx/mobx.dart';
part 'pray_store.g.dart';

typedef PraySetupCallback = Function(PrayInfo info);

class PrayStore = _PrayStoreBase with _$PrayStore;

abstract class _PrayStoreBase with Store {
  @observable
  AppState state = AppState.loading;

  setup(PraySetupCallback callback) {
    var json = AppCore.config.getString(AppConstants.prayInfoKey);
    var info = PrayInfo.fromJson(json);
    callback(info);
    state = AppState.ready;
  }
}
