import 'package:app/challenge/controller/challenge_controller.dart';
import 'package:app/core/core.dart';
import 'package:app/core/infrastructure/app_routes.dart';
import 'package:app/core/infrastructure/app_screen.dart';
import 'package:app/core/layout/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChallengeDetailPage extends StatefulWidget {
  const ChallengeDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ChallengeDetailPage> createState() => _ChallengeDetailPageState();
}

class _ChallengeDetailPageState extends State<ChallengeDetailPage> {
  final _controller = ChallengeController();
  final _dimens = AppCore.infra.dimens;

  @override
  void initState() {
    _controller.setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AppCore.analytics.trackScreen(AppScreen.challengesDetails);
    return AppLayout(
        pageTitle: _controller.getTitle(),
        hasBack: true,
        onBackCallback: () => Modular.to.pushNamed(AppRoutes.challenges.path),
        body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(_dimens.spaceHeigh32);
    widgetList.addAll(_controller.buildButtonList(true));
    widgetList.add(_dimens.spaceHeigh64);
    widgetList.add(_dimens.spaceHeigh64);

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center, children: widgetList);
  }
}
