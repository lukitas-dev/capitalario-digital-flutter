import 'package:app/challenge/models/challenge_info.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:mobx/mobx.dart';
part 'challenge_store.g.dart';

typedef ChallengeSetupCallback = Function(ChallengeInfo info);

class ChallengeStore = _ChallengeStoreBase with _$ChallengeStore;

abstract class _ChallengeStoreBase with Store {
  @observable
  AppState state = AppState.loading;

  setup(ChallengeSetupCallback callback) {
    var json = AppCore.config.getString(AppCore.constants.config.challengeInfo);
    var info = ChallengeInfo.fromJson(json);
    callback(info);
    state = AppState.ready;
  }
}