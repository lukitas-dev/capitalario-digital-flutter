import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_assets.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/infrastructure/app_state.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:app/ranking/controller/ranking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final _controller = RankingController();
  final _dimens = AppCore.infra.dimens;

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.ranking);
    return AppLayout(
        pageTitle: _controller.getTitle(),
        mobileBodyPadding: const EdgeInsets.all(0),
        body: Observer(
          builder: (_) {
            switch (_controller.getState()) {
              case AppState.loading:
                return Center(
                  child: Image.asset(
                    AppAssets.loading.path,
                    width: 150,
                  ),
                );
              case AppState.ready:
                return _buildBody(context);
              case AppState.failure:
              default:
                return const Center(
                  child: Text("Houve um problema no carregamento da página"),
                );
            }
          },
        ));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.addAll(_controller.buildRankingItemList(context));
    widgetList.add(_dimens.spaceHeigh128);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
