import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/repository/app_repository.dart';
import 'package:app/ranking/models/ranking_info.dart';
import 'package:app/ranking/models/ranking_item_info.dart';
import 'package:mobx/mobx.dart';
part 'ranking_store.g.dart';

typedef RankingSetupCallback = Function(
    RankingInfo info, List<RankingItemInfo> itemList);

class RankingStore = _RankingStoreBase with _$RankingStore;

abstract class _RankingStoreBase with Store {
  @observable
  AppState state = AppState.loading;

  setup(RankingSetupCallback callback) async {
    var json = AppCore.config.getString(AppCore.constants.config.rankingInfo);
    var info = RankingInfo.fromJson(json);

    await AppRepository.ranking.getRankingList((list) {
      var itemList = List<RankingItemInfo>.from(
          list.map((x) => RankingItemInfo.fromMap(x)));
      callback(info, itemList);
      state = AppState.ready;
    });
  }
}
